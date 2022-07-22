import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {

  @override
  Future<bool> get isConnected async {
    final typeOfConnection = await Connectivity().checkConnectivity();
    if (typeOfConnection == ConnectivityResult.mobile || typeOfConnection == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}