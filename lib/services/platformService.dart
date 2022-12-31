import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dart_ping/dart_ping.dart';
import 'package:network_info_plus/network_info_plus.dart';

class PlatformService {
  Future<bool> isOnWifi() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return true;
  }

  Future<String?> getCurrentIP() async {
    final info = NetworkInfo();
    String? ipAddress = await info.getWifiIP();
    return ipAddress;
  }

  Future<dynamic> pingIp(String ip,
      {Duration interval = const Duration(seconds: 1),
      int pingNumber = 2}) async {
    final ping = Ping(ip, count: pingNumber, interval: interval.inSeconds);
    StreamSubscription<PingData> subscription = ping.stream.listen((event) {
      print(event);
    });
    await subscription.asFuture();
  }
}
