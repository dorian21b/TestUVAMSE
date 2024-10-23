import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/ex1.dart';
import 'package:tp2/exercices/ex2.dart';
import 'package:tp2/exercices/ex4.dart';
import 'package:tp2/exercices/ex5a.dart';
import 'package:tp2/exercices/ex5b.dart';
import 'package:tp2/exercices/ex5c.dart';
import 'package:tp2/exercices/ex6a.dart';
import 'package:tp2/exercices/ex6b.dart';
import 'package:tp2/exercices/ex6c.dart';
import 'package:tp2/exercices/ex6d.dart';
import 'package:tp2/exercices/ex7.dart';
import 'package:tp2/classes/classe_exercice.dart';

void main() {
  runApp(
    MaterialApp(
      title: "TP2",
      home: TodosScreen(
        exercices: [
          Exercice(
              'Exercise 1',
              'Display an image',
          ),
          Exercice(
              'Exercise 2',
              'Transform an image',
          ),
          Exercice(
              'Exercise 4',
              'Display a tile (a piece of image)',
          ),
          Exercice(
              'Exercise 5a',
              'Generate a board of randomly colored tiles',
          ),
          Exercice(
              'Exercise 5b',
              'Generate a board of tiles from an image',
          ),
          Exercice(
              'Exercise 5c',
              'Setup a sliding taquin board',
          ),
          Exercice(
              'Exercise 6a',
              'Move tiles',
          ),
          Exercice(
              'Exercise 6b',
              'Move tiles with unique colors and text',
          ),
          Exercice(
              'Exercise 6c',
              'Exercise 6c: move tiles in a grid',
          ),
          Exercice(
              'Exercise 6d',
              'Move tiles in a taquin grid with size modifier',
          ),
          Exercice(
              'Exercise 7',
              'Jeu de taquin with an A star resolution algorithm.',
          ),
        ],
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key, required this.exercices}) : super(key: key);

  final List<Exercice> exercices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TP2',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
          itemCount: exercices.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black), 
                borderRadius: BorderRadius.circular(10), 
              ),
              margin: EdgeInsets.all(8), 
              child: ListTile(
                title: Text(
                  exercices[index].title,
                  style: TextStyle(
                  fontFamily: "PlayfairDisplay",
                  fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  exercices[index].description,
                  style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                  ),
                ),
                trailing: Icon(Icons.arrow_right_rounded, size: 36),
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex1(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex2(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex4(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex5a(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex5b(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 5) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex5c(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex6a(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 7) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex6b(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 8) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex6c(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 9) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex6d(exercice: exercices[index]),
                      ),
                    );
                  } else if (index == 10) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Ex7(exercice: exercices[index]),
                      ),
                    );
                  }  
                },
              ),
            );
          },
        ),
    );
  }
}