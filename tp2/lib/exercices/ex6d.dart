import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

Map<int, List<int>> neighbors = {
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

class Tile {
  Color color = Colors.grey;
  String text;
  int position;

  Tile(this.color, this.text, this.position);
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
    final bool isNeighbor =
        neighbors[widget.currentWhiteTile]?.contains(widget.tile.position) ??
            false;

    return GestureDetector(
      onTap: () {
        widget.onTileTapped(widget.tile.position);
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.currentWhiteTile == widget.tile.position
              ? Colors.white
              : widget.tile.color,
          border: isNeighbor ? Border.all(color: Colors.red, width: 5) : null,
        ),
        child: Center(
          child: Text(
            widget.tile.text,
            style: TextStyle(
              fontSize: 24,
              color: widget.currentWhiteTile == widget.tile.position
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Ex6d extends StatefulWidget {
  final Exercice exercice;

  const Ex6d({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex6dState createState() => _Ex6dState();
}

class _Ex6dState extends State<Ex6d> {
  int currentWhiteTile = -1;
  late List<String> texts = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = generateTiles();
  }

  List<Widget> generateTiles() {
    List<Widget> generatedTiles = [];
    for (int i = 1; i <= 9; i++) {
      Tile tile = Tile(Colors.grey, texts[i - 1], i);
      generatedTiles.add(TileWidget(tile, currentWhiteTile, _handleTileTap));
    }
    return generatedTiles;
  }

 /* void swapTiles(int whiteTileIndex, int neighborIndex) {
    setState(() {
      TileWidget whiteTile = tiles[whiteTileIndex] as TileWidget;
      TileWidget neighborTile = tiles[neighborIndex] as TileWidget;
      
      
      tiles[whiteTileIndex] = neighborTile;
      tiles[neighborIndex] = whiteTile;

      
      int tempPosition = whiteTile.tile.position;
      whiteTile.tile.position = neighborTile.tile.position;
      neighborTile.tile.position = tempPosition;
    });
  }*/

  void _handleTileTap(int tileNumber) {
    setState(() {
     
      if (currentWhiteTile == tileNumber) {
        currentWhiteTile = -1;
        return;
      } else {
        
        currentWhiteTile = tileNumber;

     
      bool isNeighbor = neighbors[currentWhiteTile]?.contains(tileNumber) ?? false;

      /*if (isNeighbor) {
        
        int whiteTileIndex = tiles.indexWhere((widget) => (widget as TileWidget).tile.position == currentWhiteTile);
        
        int clickedTileIndex = tiles.indexWhere((widget) => (widget as TileWidget).tile.position == tileNumber);
        
        
        swapTiles(whiteTileIndex, clickedTileIndex);
        
        currentWhiteTile = tileNumber;
      }*/ 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = generateTiles();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 6d: bouger des tuiles dans une grille',
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
