import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';

Color generateRandomColor() {
  Random random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1.0,
  );
}

class Ex5a extends StatelessWidget {
  final Exercice exercice;

  const Ex5a({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 5a: génération du plateau de tuiles de couleurs aléatoires',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: Container(
            height: 500, 
            width: 500,
            child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
        children: List.generate(9, (index) {
          Color randomColor = generateRandomColor();
          return Container(
            padding: const EdgeInsets.all(8),
            color: randomColor,
            child: Center(child: Text(
                'Tuile ${index + 1}', 
                style: TextStyle(color: Colors.white),
                ),
            ),
          );
        }),
        ),
      ),
    ),
    );
  }
}