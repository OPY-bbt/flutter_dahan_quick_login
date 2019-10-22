import 'dart:async';

import 'package:flutter/services.dart';

class FlutterDahanQuickLogin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_dahan_quick_login');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
