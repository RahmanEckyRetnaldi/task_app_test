import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// class to check whether current app is connected to network or not
/// using InternetConnectionChecker.
/// on web platform, it will always true.
abstract class NetworkInfo {
  Future<bool> get isConnected;
  bool get isConnectedSync;

  Stream<InternetStatus> get onStatusChange;

  enableIsConnectedSync([bool enabled = true]);
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async =>
      await connectionChecker.hasInternetAccess;

  @override
  bool get isConnectedSync =>
      connectionChecker.lastTryResults == InternetStatus.connected;

  @override
  Stream<InternetStatus> get onStatusChange => connectionChecker.onStatusChange;

  StreamSubscription<InternetStatus>? enableSyncListener;
  @override
  enableIsConnectedSync([bool enabled = true]) {
    if (enabled && enableSyncListener == null) {
      enableSyncListener = onStatusChange.listen((event) {});
    } else {
      enableSyncListener?.cancel();
      enableSyncListener = null;
    }
  }
}
