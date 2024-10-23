import 'package:tp2/classes/classe_exercice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

class Tile {
  Color color = Colors.grey;
  String text;

  Tile(this.color, this.text);

  Tile.randomColor(this.text) {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
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

class Ex6a extends StatefulWidget {
  final Exercice exercice;

  const Ex6a({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex6aState createState() => _Ex6aState();
}

class _Ex6aState extends State<Ex6a> {
  late List<String> texts = ['A', 'B'];
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = List<Widget>.generate(
      texts.length,
      (index) => TileWidget(Tile.randomColor(texts[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 6a: Move tiles',
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
