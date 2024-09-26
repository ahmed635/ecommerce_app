import 'package:connectivity_plus/connectivity_plus.dart';

checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
