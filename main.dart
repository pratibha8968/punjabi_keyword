
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter DemoApplication',
      // theme: ThemeData(
      //    primarySwatch: Colors.green,
      // ),
      home: MyHomePage(
          title: 'Google'
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  static const platform = MethodChannel(
      'https://www.sikhitothemax.org/?gclid=EAIaIQobChMI89-Rq-jc-gIVk5NmAh3fKwifEAAYASAAEgJzefD_BwE');

  Future<void> _openBrowser() async {
    try {
      final int result = await platform.invokeMethod(
          'openBrowser', <String, String>{
        'url': "https://www.sikhitothemax.org/?gclid=EAIaIQobChMI89-Rq-jc-gIVk5NmAh3fKwifEAAYASAAEgJzefD_BwE"
      });
    }
    on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child:TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter Password',
            ),
            onTap: (){
              _launchInBrowser(Uri.parse('https://www.sikhitothemax.org/?gclid=EAIaIQobChMI89-Rq-jc-gIVk5NmAh3fKwifEAAYASAAEgJzefD_BwE'));


            },
          ),





          ),

    );
  }
}