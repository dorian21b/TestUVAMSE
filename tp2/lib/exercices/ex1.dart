import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Ex1 extends StatelessWidget {
  //static const routeName = '/';
  //static const fullPath = '/$routeName';

  const Ex1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 1',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      //body:
    );
  }
}
