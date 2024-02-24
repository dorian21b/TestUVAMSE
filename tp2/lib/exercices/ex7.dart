import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';
import 'package:tp2/classes/AStar.dart';
import 'package:tp2/classes/Taquin.dart';
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
int currentWhiteTile = -1;
List<String> finalTaquintext = ["1","2","3","4","5","6","7","8", ""];

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
              fontSize: 24 - (_currentSliderValue * 1),
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

class Ex7 extends StatefulWidget {
  final Exercice exercice;

  const Ex7({Key? key, required this.exercice}) : super(key: key);

  @override
  _Ex7State createState() => _Ex7State();
}

class _Ex7State extends State<Ex7> {
  bool startButtonPressed = false;
  int currentWhiteTile = -1;

  List<String> definition_texts(int size) {
    List<String> texts = [];
    for (int i = 1; i <= size * size - 1; i++) {
      texts.add("$i");
    }
    texts.add("");
    finalTaquintext = texts;
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
    for (int i = 1; i <= _currentSliderValue.toInt() * _currentSliderValue.toInt(); i++) {
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
      if (isNeighbor) {
        int a = tileNumber;
        List<String> newtexts = swap(texts, currentWhiteTile, tileNumber);
        currentWhiteTile = a;
      } 
    });
  }

  void shuffleTiles() {
  bool solvable = false;
  List<String> shuffledTexts = List.from(texts); // Copie de la liste des textes

  // Algorithme de mélange de Fisher-Yates
  for (int i = shuffledTexts.length - 1; i > 0; i--) {
    int j = random.nextInt(i + 1);
    String temp = shuffledTexts[i];
    shuffledTexts[i] = shuffledTexts[j];
    shuffledTexts[j] = temp;
  }

  // Vérifier si la configuration mélangée est soluble
  while (!solvable) {
    int inversionCount = 0;

    for (int i = 0; i < shuffledTexts.length - 1; i++) {
      for (int j = i + 1; j < shuffledTexts.length; j++) {
        if (shuffledTexts[i].isNotEmpty && shuffledTexts[j].isNotEmpty) {
          if (int.parse(shuffledTexts[i]) > int.parse(shuffledTexts[j])) {
            inversionCount++;
          }
        }
      }
    }

    // Si le nombre d'inversions est pair, la configuration est soluble
    if (inversionCount % 2 == 0) {
      solvable = true;
    } else {
      // Répéter le mélange jusqu'à obtenir une configuration soluble
      shuffledTexts.shuffle();
    }
  }

  // Mettre à jour les textes et la position de la tuile vide
  setState(() {
    texts = shuffledTexts;
    currentWhiteTile = texts.indexOf("")+1;
    tiles = generateTiles(texts);
  });
}


  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = generateTiles(texts);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 7: jeu de taquin ',
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
          crossAxisAlignment: CrossAxisAlignment.center,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: startButtonPressed ? null : () {
                    setState(() {
                      _currentSliderValue = (_currentSliderValue - 1).clamp(2, 10);
                      texts = definition_texts(_currentSliderValue.toInt());
                      tiles = generateTiles(texts);
                      neighbors = definition_neighbors(_currentSliderValue.toInt());
                    });
                  },
                  icon: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      startButtonPressed = true;
                      shuffleTiles(); 
                      print(finalTaquintext);
                      print(texts);
                      //currentWhiteTile = texts.indexOf("")+1; //enlever apres
                      List<String> initialTaquin_texts = texts;
                      //List<String> initialTaquin_texts =  ["4","","8","6","3","1","2","7", "5"]; fonctionne
                      //List<String> initialTaquin_texts = ["2","5","3","1","7","","4","8","6"]; possible
                      //List<String> initialTaquin_texts =  ["2","","3","1","5","6","4","7", "8"]; possible

                      Taquin initialTaquin = Taquin(initialTaquin_texts,_currentSliderValue.toInt());
                      Taquin finalTaquin = Taquin(finalTaquintext,_currentSliderValue.toInt());
                      
                      
                      List<String> solution = solveTaquin( initialTaquin,  finalTaquin);
                      print("solution = $solution");
                      /*
                      Taquin copy_initialTaquin = initialTaquin.copy();
                      List<String> moves = [];
                      Set<Taquin> closedSet = {}; // ensemble pour stocker les états déjà explorés

                      PriorityQueue openSet = PriorityQueue([]);
                      openSet.add(copy_initialTaquin);
                      Taquin current = openSet.removeFirst();
                      print(current ==initialTaquin );
                      
                      print("Voisins");
                      List<Taquin> neighbors_taquin = exploreNeighbors(current);
                      for (int i = 0 ; i<neighbors_taquin.length; i++){
                        print("1 - un voisin");
                        print(neighbors_taquin[i].tiles_taquin);
                        neighbors_taquin[i].updatePriority();
                        openSet.add(neighbors_taquin[i]);
                        neighbors_taquin[i].parent = current;

                      }
                    
                      print("nouveau element");
                      Taquin current2 = openSet.removeFirst();
                      List<Taquin> neighbors_taquin2 = exploreNeighbors(current);
                      for (int i = 0 ; i<neighbors_taquin.length; i++){
                        print("2 - un voisin");
                        print(neighbors_taquin[i].tiles_taquin);
                        neighbors_taquin[i].updatePriority();
                        openSet.add(neighbors_taquin[i]);
                        neighbors_taquin[i].parent = current;

                      }
                      */

        

                    });
                  },
                  child: Text('Start'),
                ),
                IconButton(
                  onPressed: startButtonPressed ? null : () {
                    setState(() {
                      _currentSliderValue = (_currentSliderValue + 1).clamp(2, 10);
                      texts = definition_texts(_currentSliderValue.toInt());
                      tiles = generateTiles(texts);
                      neighbors = definition_neighbors(_currentSliderValue.toInt());
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
