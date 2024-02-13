import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';

class Ex1 extends StatelessWidget {
  final Exercice exercice;

  const Ex1({Key? key, required this.exercice}) : super(key: key);

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
      body: Center(
        child: Image.asset(
          'assets/StarWarsMoviePoster1977.jpg',
          width: 300,
          height: 500,
        ),
      ),
    );
  }
}