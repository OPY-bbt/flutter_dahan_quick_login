import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FlutterDahanQuickLogin {
  static const String _METHOD_REGISTERAPP = 'registerApp';
  static const String _METHOD_GETPHONE = 'getPhone';
  static const String _ARGUMENT_KEY_APPID = 'appId';
  static const String _ARGUMENT_KEY_APPKEY = 'appKey';

  static const MethodChannel _channel =
      const MethodChannel('flutter_dahan_quick_login');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> registerApp({
    @required String appId,
    @required String appKey,
  }) {
    assert(appId.isNotEmpty, 'appId is required');
    return _channel.invokeMethod(
      _METHOD_REGISTERAPP,
      <String, dynamic>{
        _ARGUMENT_KEY_APPID: appId,
        _ARGUMENT_KEY_APPKEY: appKey,
      },
    );
  }

  Future<dynamic> getPhone() {
    return _channel.invokeMethod(_METHOD_GETPHONE);
  }
}
