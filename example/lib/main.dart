import 'package:flutter/material.dart';
import 'package:platform_utils/platform_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Platform Utils'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = PlatformUtils.select(
      ios: "ios",
      android: "android",
      web: "web",
      fuchsia: "fuchsia",
    );

    final valueFromFunction = PlatformUtils.select(
      ios: () => "ios",
      android: () => "android",
      web: () => "web",
      fuchsia: () => "fuchsia",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("value: $value, valueFromFunction: $valueFromFunction")
          ],
        ),
      ),
    );
  }
}
