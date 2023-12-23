

import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../common/strings_manager.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}


class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure user is not authorised
  static const int NOT_FOUND =
  404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
  500; // failure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String SUCCESS = 'Success';//StringManager.success; // success with data
  static const String NO_CONTENT ="No Content";
  // StringManager.noContent; // success with no content
  static const String BAD_REQUEST = "Bad Request ";
  // StringManager.badRequestError; // failure, api rejected our request
  static const String FORBIDDEN = "Forbidden";
  // StringManager.forbiddenError; // failure,  api rejected our request
  static const String UNAUTHORISED = "Unauthorised";
  // StringManager.unauthorizedError; // failure, user is not authorised
  static const String NOT_FOUND = "Not Found";
  // StringManager
  // .notFoundError; // failure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR = " Internal server error";
  // StringManager.internalServerError; // failure, a crash happened in API side.

  // local responses codes
  static const String DEFAULT = " Default";
  // StringManager.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT = "Connect Time out";
  // StringManager.timeoutError; // issue in connectivity
  static const String CANCEL = "Cancel";
  // StringManager.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT = "Receive Timeout";
  // StringManager.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT = "Send Timeout";
  // StringManager.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = "Cachec error";
  // StringManager.defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION = "No Internet connection";
// StringManager.noInternetError; // issue in connectivity
}


class Failure {
  int code; // 200 or 400
  bool status; // 200 or 400
  String message; // error or success


  Failure(this.code, this.message,this.status);
}

extension DataSourceExtension on DataSource {
  Failure getFailure({String? message}) {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, message.toString(),false);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, message.toString(),false);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, StringsManager.unauthorizedMsg.trim(),false);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, message.toString(),false);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            message.toString(),false);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT.trim(),false);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, message.toString(),false);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, message.toString(),false);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, message.toString(),false);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, message.toString(),false);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION.trim(),false);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseCode.DEFAULT.toString(),false);
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, message!,false);
      default:
        return Failure(ResponseCode.DEFAULT, StringsManager.serverError,false);
    }
  }
}

class AppExceptions implements Exception {
  late Failure failure;

  AppExceptions.handle(dynamic error, {BuildContext? context,String? message}){
    if (error is HttpResponse) {
      failure = _handleException(error);
    } else if(error == "401"){
      // buildToast(StringsManager.unauthorizedMsg);
      failure = DataSource.UNAUTHORISED.getFailure();
      //logout user

    }else if(error == "200"){
      failure = DataSource.SUCCESS.getFailure(message: message);
    }
    else {
      // buildToast(StringsManager.serverError);
      failure = DataSource.DEFAULT.getFailure();
    }


  }

  Failure _handleException(HttpResponse error) {
    switch (error.statusCode) {
      case ResponseCode.CONNECT_TIMEOUT:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case ResponseCode.SEND_TIMEOUT:
        return DataSource.SEND_TIMEOUT.getFailure();
      case ResponseCode.RECEIVE_TIMEOUT:
        return DataSource.RECEIVE_TIMEOUT.getFailure();

      case ResponseCode.BAD_REQUEST:
        return DataSource.BAD_REQUEST.getFailure();
      case ResponseCode.FORBIDDEN:
        return DataSource.FORBIDDEN.getFailure();
      case ResponseCode.UNAUTHORISED:
        debugPrint("DataSource.UNAUTHORISED--> ${DataSource.UNAUTHORISED}");
        return DataSource.UNAUTHORISED.getFailure();
      case ResponseCode.NOT_FOUND:
        return DataSource.NOT_FOUND.getFailure();
      case ResponseCode.INTERNAL_SERVER_ERROR:
        return DataSource.INTERNAL_SERVER_ERROR.getFailure();

      case ResponseCode.CANCEL:
        return DataSource.CANCEL.getFailure();

      default:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}