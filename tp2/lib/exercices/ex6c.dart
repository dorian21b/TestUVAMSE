import 'package:tp2/classes/classe_exercice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class Tile {
  Color color = Colors.grey;
  String text = 'tuile';

  Tile(this.color, this.text);
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return coloredBox();
  }

  Widget coloredBox() {
  return SizedBox(
    width: 100.0, 
    height: 100.0,
    child: Container(
      color: tile.color,
      child: Center(
        child: Text(
          tile.text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}



}

class Ex6c extends StatefulWidget {
  final Exercice exercice;

  const Ex6c({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex6cState createState() => _Ex6cState();
}

class _Ex6cState extends State<Ex6c> {
  late List<String> texts = ['A', 'B'];
  late List<Widget> tiles; 

  @override
  void initState() {
    super.initState();
    tiles = List<Widget>.generate(
      texts.length,
      (index) => TileWidget(Tile(Colors.grey, texts[index])),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 6c: Bouger des tuiles avec clique sur la tuile',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Row(
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sentiment_very_satisfied),
        onPressed: swapTiles,
      ),
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
