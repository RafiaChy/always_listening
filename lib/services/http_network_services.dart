import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class HttpNetworkServices {
  //GET API CALL

  Future<dynamic> postMultiPartResponse(
      {required String url,
        dynamic bodyData,
       required Map<String, String> header}) async {

    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.files.add(bodyData);
    request.headers.addAll(header);
    request.fields.addAll(bodyData!);
    try {
      var responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);

      debugPrint("Post Multipart Response : --> ${response}");
      if (response.statusCode == 200) {
        return response;
      }else{
        return null;
      }
    } catch (e) {
      debugPrint("Something went wrong : --> ${e.toString()}");
    }
  }
}

dynamic apiResponse({required http.Response response}) {
  if (response == null) return null;

  if (response.body.isEmpty) return null;
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;

    case 400:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;

    case 401:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;

    case 403:
      return null;

    case 404:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;

    default:
      var responseJson = jsonDecode(response.body.toString());
      return responseJson;
  }
}