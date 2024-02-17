import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

class Tile {
  Color color = Colors.grey;
  int number;

  Tile(this.color, this.number);
  
  Tile.randomColor(this.number) {
    this.color = Colors.grey;
  }
}

class TileWidget extends StatefulWidget {
  final Tile tile;
  final int currentWhiteTile;
  final void Function(int) onTileTapped; 

  TileWidget(this.tile, this.currentWhiteTile, this.onTileTapped);

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
   
    final Map<int, List<int>> neighbors = {
      1: [2, 4],
      2: [1, 3, 5],
      3: [2, 6],
      4: [1, 5, 7],
      5: [2, 4, 6, 8],
      6: [3, 5, 9],
      7: [4, 8],
      8: [5, 7, 9],
      9: [6, 8],
    };

   
    final bool isNeighbor =
        neighbors[widget.currentWhiteTile]?.contains(widget.tile.number) ?? false;

    return GestureDetector(
      onTap: () {
        widget.onTileTapped(widget.tile.number);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.currentWhiteTile == widget.tile.number ? Colors.white : widget.tile.color,
          
          border: isNeighbor
              ? Border.all(color: Colors.red, width: 5)
              : null, 
        ),
        child: Center(
          child: Text(
            widget.tile.number.toString(),
            style: TextStyle(
              fontSize: 24,
              color: widget.currentWhiteTile == widget.tile.number ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Ex6b extends StatefulWidget {
  final Exercice exercice;

  const Ex6b({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex6bState createState() => _Ex6bState();
}

class _Ex6bState extends State<Ex6b> {
  int currentWhiteTile = -1; 

  List<Widget> generateTiles() {
    List<Widget> tiles = [];
    for (int i = 1; i <= 9; i++) {
      Tile tile = Tile.randomColor(i);
      tiles.add(TileWidget(tile, currentWhiteTile, _handleTileTap)); 
    }
    return tiles;
  }

  void _handleTileTap(int tileNumber) {
    setState(() {
      if (currentWhiteTile == tileNumber) {
        currentWhiteTile = -1; 
      } else {
        currentWhiteTile = tileNumber; 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = generateTiles();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 6b: bouger des tuiles dans une grille',
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
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: tiles,
          ),
        ),
      ),
    );
  }
}
