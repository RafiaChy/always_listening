import 'dart:convert';

import 'package:always_listening/data_layer/models/common_response_model.dart';

import 'package:dartz/dartz.dart';

import '../../app_exceptions/app_exceptions.dart';
import '../../domain_layer/repository/repository.dart';
import '../../root_app.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl extends Repository {
  NetworkInfo networkInfo;
  RemoteDataSource remoteDataSource;

  RepositoryImpl(
    this.remoteDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, CommonResponseModel>> sendAudio(
      {required String filePath}) async {

    if (await networkInfo.isConnected) {
      try {
       final response = await remoteDataSource.sendAudio(filePath: filePath);


        Map<String, dynamic> responseJson = jsonDecode(response.body);
        CommonResponseModel model = CommonResponseModel.fromJson(responseJson);
        if (response.statusCode == 200) {
          return Right(model);
        } else {
          return Left(
              Failure(0, model.responseData.message!, response.status));
        }
      } catch (error) {
        return (Left(AppExceptions.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
