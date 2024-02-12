import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/exercices/ex1.dart';
import 'package:tp2/exercices/ex2.dart';
import 'package:tp2/classes/classe_exercice.dart';

void main() {
  runApp(
    MaterialApp(
      title: "TP2",
      home: TodosScreen(
        exercices: [
          Exercice(
            'Exercice 1',
            'Description de l\'exercice 1',
          ),
          Exercice(
            'Exercice 2',
            'Description de l\'exercice 2',
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
            fontSize: 30,
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
                title: Text(exercices[index].title),
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
                  }
                },
              ),
            );
          },
        ),
    );
  }
}