import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dahan_quick_login/flutter_dahan_quick_login.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_dahan_quick_login');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterDahanQuickLogin.platformVersion, '42');
  });
}
