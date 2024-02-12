import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "TP2",
            style: TextStyle(
              fontFamily: "PlayfairDisplay",
              ),
            ),
          centerTitle:true,
          backgroundColor: Colors.red[600],
        ), 
        //body: 
  );
  }
}