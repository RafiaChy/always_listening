import 'package:always_listening/data_layer/models/common_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../app_exceptions/app_exceptions.dart';

abstract class Repository {
  Future<Either<Failure, CommonResponseModel>> sendAudio({required String filePath});
}