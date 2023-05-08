import 'dart:io';

import 'package:flutter/material.dart';

class WifiPage extends StatefulWidget {
  late final Socket channel;
  WifiPage(this.channel);

  @override
  MyWifiPage createState(){
    return MyWifiPage();
  }
}

class MyWifiPage extends State<WifiPage>{
  late Stream stream;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conexiòn WiFi"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              ElevatedButton(onPressed: prender,
                  child: const Text("Prender")),
              ElevatedButton(onPressed: apagar,
                  child: const Text("Apagar")),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  StreamBuilder(
                    stream: widget.channel,
                    builder: (context, snapshot){
                      if(!snapshot.hasData){
                        return(const Text("Aaaaaaaaa"));
    }
                      return Padding(
                      padding: const EdgeInsets.symmetric( vertical: 24),
                      child: Text(snapshot.hasData
                      ? '${String.fromCharCodes(snapshot.data!)}' : ''),
                      );

                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void prender() {
    widget.channel.write("p");
  }

  void apagar() {
    widget.channel.write("a");
    dispose();
  }
  @override
  void dispose(){
    widget.channel.close();
    super.dispose();
  }
}

