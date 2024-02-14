import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';

class Ex3 extends StatelessWidget {
  final Exercice exercice;

  const Ex3({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 3',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      //body:
    );
  }
}