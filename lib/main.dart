import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wifi/wifipage.dart';

void main() async {
  Socket sock = await Socket.connect('172.20.10.8', 80);
  runApp(MyApp(sock));
}

class MyApp extends StatelessWidget{
  late Socket socket;
  MyApp(Socket sock){
    this.socket = sock;
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: WifiPage(socket),
    );
  }
}

