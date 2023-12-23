import 'package:always_listening/presentation_layer/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data_layer/data_source/remote_data_source.dart';
import '../data_layer/network/network_info.dart';
import '../data_layer/repository_implementations/repository_implementation.dart';
import '../domain_layer/repository/repository.dart';
import '../domain_layer/use_case/send_audio_use_case.dart';
import '../services/http_network_services.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  instance
      .registerLazySingleton<HttpNetworkServices>(() => HttpNetworkServices());

  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
    instance(),
    instance(),
  ));
}

 initHomeModule(){
  if(!GetIt.I.isRegistered<SendAudioUseCase>()){
    instance.registerFactory<SendAudioUseCase>(() => SendAudioUseCase(instance()));
    instance.registerFactory<HomeBloc>(() => HomeBloc(
        sendAudioUseCase:  instance(),
      ));
  }
}