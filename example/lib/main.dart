import 'package:flutter/material.dart';
import 'package:flutter_dahan_quick_login/flutter_dahan_quick_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterDahanQuickLogin _instance = FlutterDahanQuickLogin();

  @override
  void initState() {
    super.initState();
  }

  _handleRegisterApp() async {
    await _instance.registerApp(appId: 'appid', appKey: 'appKey');
  }

  _handleGetPhoneTap() async {
    var result = await _instance.getPhone();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("register app"),
                onPressed: _handleRegisterApp,
              ),
              RaisedButton(
                child: Text("get phone"),
                onPressed: _handleGetPhoneTap,
              )
            ],
          ),
        ),
      ),
    );
  }
}
