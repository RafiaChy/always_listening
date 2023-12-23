import 'package:always_listening/app_configurations/app_environments.dart';
import 'package:always_listening/common/url_manager.dart';

import '../../services/http_network_services.dart';

abstract class RemoteDataSource {
  Future<dynamic> sendAudio({required String filePath});
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final HttpNetworkServices httpNetworkServices;
  final String authorization = "Authorization";
  final String contentType = "Content-Type";
  final String multiPartData = "multipart/form-data";
  RemoteDataSourceImplementer(this.httpNetworkServices);

  Future<Map<String, String>> setHeader() async {
    Map<String, String> headers;
    headers = {
      contentType: multiPartData,
      authorization: 'Bearer ${AppEnvironments.bearerToken}',
    };
    return headers;
  }

  @override
  Future<dynamic> sendAudio({required String filePath}) async {

    final response = await httpNetworkServices.postMultiPartResponse(
      bodyData: filePath,
        url: '${AppEnvironments.baseUrl}${UrlManager.sendAudioUrlSuffix}',
        header: await setHeader());
    print('response here ');
    print(response.statusCode);
    print(response.body);
    return response;
  }

}