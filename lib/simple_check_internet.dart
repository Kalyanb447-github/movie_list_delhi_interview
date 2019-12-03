import 'package:flutter/material.dart';
import 'dart:io';
class HaveInteret extends StatefulWidget {
  @override
  _HaveInteretState createState() => _HaveInteretState();
}

class _HaveInteretState extends State<HaveInteret> {
String connection='undefined';

  testConnection()async{
    try {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connection='Have internet';
    print('connected');
  }
} on SocketException catch (_) {
  connection='no internet';
  print('not connected');
}
  }

  @override
  void initState() { 
    super.initState();
    testConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(connection),
      ),
    );
  }
}
