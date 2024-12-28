

import 'package:common_dependency/common_dependency.dart';

import 'dio_services.dart';
import 'network_info.dart';

class ApiModule {
  Future<void> call(
      GetIt di, {
        Dio Function(GetIt di) dio = _defaultDio,
        DioService Function(GetIt di) dioService = _defaultDioService,
        List<InternetCheckOption>? connectStatusServers,
        Duration connectCheckerInterval = const Duration(seconds: 5),
        bool enableSyncIsConnected = true,
      }) async {
    di.registerLazySingleton(
          () => dioService(di),
    );

    //third party dependency
    di.registerLazySingleton(
          () => InternetConnection.createInstance(
          checkInterval: connectCheckerInterval,
          customCheckOptions: connectStatusServers ??
              [
                InternetCheckOption(uri: Uri.parse('https://icanhazip.com/')),
                InternetCheckOption(
                  uri:
                  Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
                ),
              ],
          useDefaultOptions: false),
    );
    di.registerLazySingleton<NetworkInfo>(() =>
    NetworkInfoImpl(di())..enableIsConnectedSync(enableSyncIsConnected));
    di.registerLazySingleton(() => dio(di));
  }

  static Dio _defaultDio(GetIt di) => Dio();

  static DioService _defaultDioService(GetIt di) => DioService(
    dioClient: di(),
    interceptors: [],
  );
}
