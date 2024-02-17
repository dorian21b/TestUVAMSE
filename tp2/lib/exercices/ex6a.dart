import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';
import 'dart:math' as math;


math.Random random = new math.Random();

class Tile {
  Color color = Colors.grey;

  Tile(this.color);
  
  Tile.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

class Ex6a extends StatefulWidget {
  final Exercice exercice;

  const Ex6a({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex6aState createState() => _Ex6aState();
}

class _Ex6aState extends State<Ex6a> {
   List<Widget> tiles =
      List<Widget>.generate(2, (index) => TileWidget(Tile.randomColor()));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 6a: bouger des tuiles',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body:
        
        Row(children: tiles),
        
      
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
