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
double _currentSliderValue = 3;

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
              fontSize: 24 - (_currentSliderValue * 2),
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
  

  List<String> definition_texts(int size) {
    List<String> texts = [];
    for (int i = 1; i <= size * size; i++) {
      texts.add("tuile $i");
    }
    return texts;
  }

  Map<int, List<int>> definition_neighbors(int n) {
    Map<int, List<int>> neighbors = {};

    for (int i = 1; i <= n * n; i++) {
      List<int> tileNeighbors = [];

      int row = (i - 1) ~/ n;
      int col = (i - 1) % n;

      if (row > 0) tileNeighbors.add(i - n);
      if (row < n - 1) tileNeighbors.add(i + n);
      if (col > 0) tileNeighbors.add(i - 1);
      if (col < n - 1) tileNeighbors.add(i + 1);

      neighbors[i] = tileNeighbors;
    }

    return neighbors;
  }

  late List<String> texts;
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    texts = definition_texts(_currentSliderValue.toInt());
    tiles = generateTiles(texts);
    neighbors = definition_neighbors(_currentSliderValue.toInt());
  }

  List<Widget> generateTiles(List<String> liste_texts) {
    List<Widget> generatedTiles = [];
    for (int i = 1; i <= _currentSliderValue.toInt()*_currentSliderValue.toInt(); i++) {
      Tile tile = Tile(Colors.grey, liste_texts[i - 1], i);
      generatedTiles.add(TileWidget(tile, currentWhiteTile, _handleTileTap));
    }
    return generatedTiles;
  }

  List<String> swap(List<String> liste_t, int index1, int index2) {
    String temp = liste_t[index1 - 1];
    liste_t[index1 - 1] = liste_t[index2 - 1];
    liste_t[index2 - 1] = temp;
    return liste_t;
  }

  void _handleTileTap(int tileNumber) {
    setState(() {
      bool isNeighbor = neighbors[currentWhiteTile]?.contains(tileNumber) ?? false;
      if (currentWhiteTile == tileNumber) {
        currentWhiteTile = -1;
        
        return;
      } else if (isNeighbor) {
        int a = tileNumber;
        List<String> newtexts = swap(texts, currentWhiteTile, tileNumber);
        currentWhiteTile = a;
      } else {
        currentWhiteTile = tileNumber;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = generateTiles(texts);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 6d: Bouger des tuiles dans une grille avec modificateur de taille',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 500,
                width: 500,
                child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  crossAxisCount: _currentSliderValue.toInt(),
                  children: tiles,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Taille: ',
                    style: TextStyle(
                      fontFamily: "PlayfairDisplay",
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 3,
                    max: 10,
                    divisions: 7,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        texts = definition_texts(_currentSliderValue.toInt());
                        tiles = generateTiles(texts);
                        neighbors = definition_neighbors(_currentSliderValue.toInt());
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


