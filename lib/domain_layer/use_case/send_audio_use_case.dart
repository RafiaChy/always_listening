import 'package:always_listening/data_layer/models/common_response_model.dart';
import 'package:dartz/dartz.dart';

import '../../app_exceptions/app_exceptions.dart';
import '../repository/repository.dart';
import 'base_use_case.dart';

class SendAudioUseCase extends BaseUseCase<String, CommonResponseModel> {
  final Repository _repository;
  SendAudioUseCase(this._repository);
  @override
  Future<Either<Failure, CommonResponseModel>> execute(String input) {

    return _repository.sendAudio(filePath: input);
  }
}