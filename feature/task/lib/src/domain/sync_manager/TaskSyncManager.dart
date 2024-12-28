import 'dart:async';

import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/domain/domain.dart';

class TaskSyncManager {
  final SyncTaskUseCase syncTaskUseCase;
  final NetworkInfo networkInfo;

  TaskSyncManager(
    this.syncTaskUseCase,
    this.networkInfo,
  );

  StreamSubscription? _networkSubscription;
  void startListener(){
    networkInfo.enableIsConnectedSync(true);
   _networkSubscription =  networkInfo.onStatusChange.listen((isConnected)async {
     print('Sync Task Execute');
      if(isConnected == InternetStatus.connected){
        await syncTaskUseCase();
      }else {
        print("No internet connection.");
      }
    });
  }

  void stopListener(){
    _networkSubscription?.cancel();
  }
}
