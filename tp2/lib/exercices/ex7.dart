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

int Nbcouppourgagner = 0;
int Nbcoupjoue = 0;
List<String> solution = [];
int difficulty = 5;
double _currentSliderValue = 3;
int currentWhiteTile = -1;
List<String> finalTaquintext = ["1","2","3","4","5","6","7","8", ""];
Taquin finalTaquin = Taquin(finalTaquintext,_currentSliderValue.toInt());
List<Taquin> coup_joue = [];


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

class IconChanger extends StatefulWidget {
  @override
  _IconChangerState createState() => _IconChangerState();
}

class _IconChangerState extends State<IconChanger> {
  int _iconIndex = 0;
  List<IconData> _icons = [
    Icons.child_care, // Facile
    Icons.access_time, // Moyen
    Icons.whatshot,   // Difficile
  ];

  List<int> _intValues = [5, 10, 15]; // Liste des entiers à utiliser
  int _intValueIndex = 0; // Index actuel dans la liste des entiers

  void _changeIconAndValue() {
    setState(() {
      _iconIndex = (_iconIndex + 1) % _icons.length; // Changement d'icône
      _intValueIndex = (_intValueIndex + 1) % _intValues.length; // Changement de l'entier
      difficulty = _intValues[_intValueIndex];
      print(difficulty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeIconAndValue,
      child: Container(
        width: 50,
        height:50,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            _icons[_iconIndex], // Affiche l'icône actuelle
            size: 50,
            color: Colors.white,
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
    bool isPlaying = false; // Ajouter cette variable pour suivre l'état du jeu


  void resetGame() {
  setState(() {
    Nbcouppourgagner = 0;
    solution = [];
    startButtonPressed = false;
    currentWhiteTile = -1;
    Nbcoupjoue = 0;
    coup_joue.clear();
    texts = definition_texts(_currentSliderValue.toInt());
    tiles = generateTiles(texts);
    bool isPlaying = false; 
  });
}

  List<String> definition_texts(int size) {
    List<String> texts = [];
    for (int i = 1; i <= size * size - 1; i++) {
      texts.add("$i");
    }
    texts.add("");
    finalTaquintext = texts;
    Taquin finalTaquin = Taquin(finalTaquintext,_currentSliderValue.toInt());
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
        List<String> coup_text = List.from(newtexts);
        Taquin coup = Taquin(coup_text,_currentSliderValue.toInt());
        coup_joue.add(coup);    
        Nbcoupjoue +=1;  
      
      } 
    });
  }

void shuffleTiles() {
  List<String> shuffledTexts = List.from(texts); // Copie de la liste des textes
  Taquin taquin_a_melanger = Taquin(shuffledTexts, _currentSliderValue.toInt());
  List<Taquin> already_explored = [taquin_a_melanger];
  int compteur = 0;
  
  while (compteur < difficulty) {
    List<Taquin> neighbors_taquin = exploreNeighbors(taquin_a_melanger);
    already_explored.add(taquin_a_melanger);
    //print(taquin_a_melanger.tiles_taquin);
    neighbors_taquin.shuffle(); // Mélanger les voisins
  for (Taquin neighbor in neighbors_taquin) {
    bool alrea = false;
    for (int i = 0; i < already_explored.length; i++) {
        if(neighbor == already_explored[i]){
          alrea = true;
          break;
        }
    }
    if(!alrea){
        taquin_a_melanger = neighbor;
      }
    }
    
    compteur++;
  }

  // Mettre à jour les textes et la position de la tuile vide
  setState(() {
    texts = taquin_a_melanger.tiles_taquin;
    currentWhiteTile = texts.indexOf("")+1;
    tiles = generateTiles(texts);
  });
}


  @override
  Widget build(BuildContext context) {
    List<Widget> tiles = generateTiles(texts);
    
    if (coup_joue.length > 1 && coup_joue.last == finalTaquin) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Félicitations !'),
            content: Text('Vous avez gagné !'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame(); 
                },
                child: Text('Fermer'),
              ),
            ],
          );
        },
      );
    });
  }
  
    

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
                      if (isPlaying) {
                    resetGame();
                    isPlaying = false;
                  } else {
                    isPlaying = true;
                      startButtonPressed = true;
                      shuffleTiles(); 
                     // print(finalTaquintext);
                    //  print(texts);
                      //currentWhiteTile = texts.indexOf("")+1; //enlever apres
                      List<String> initialTaquin_texts = List.from(texts);
                      //List<String> initialTaquin_texts =  ["4","","8","6","3","1","2","7", "5"]; fonctionne
                      //List<String> initialTaquin_texts = ["2","5","3","1","7","","4","8","6"]; possible
                      //List<String> initialTaquin_texts =  ["2","","3","1","5","6","4","7", "8"]; possible

                      final Taquin initialTaquin = Taquin(initialTaquin_texts,_currentSliderValue.toInt());
                      //final Taquin finalTaquin = Taquin(finalTaquintext,_currentSliderValue.toInt());
                      
                      
                      coup_joue.add(initialTaquin);
                      //print(initialTaquin_texts);
                      //print(texts);
                      
                      solution = solveTaquin( initialTaquin,  finalTaquin);
                      Nbcouppourgagner = solution.length ;
                      //print("solution = $solution");
                  }

                    });
                  },
                   child: Text(isPlaying ? 'Stop' : 'Start'),
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
                IconChanger(), // Le widget IconChanger ajouté ici
              ],
            ),
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
    ElevatedButton(
      onPressed: () {
        setState(() {
          if (coup_joue.length > 1) {
            coup_joue.removeLast();
            texts = List.from(coup_joue.last.tiles_taquin);
            currentWhiteTile = texts.indexOf("") + 1;
            Nbcoupjoue -=1;
          } else {
            print("pas de coup avant");
          }
        });
      },
      child: const Text('Annuler coup'),
    ),
    SizedBox(width: 10),
    // Ajout du Text widget pour afficher Nbcoupjoue
    Text('Nombre de coups joués: $Nbcoupjoue'),
  ],
),
            Row(
  children: [
    ElevatedButton(
      onPressed: () {
        setState(() {
          // Liste de chaînes de caractères représentant la solution
          
          
          // Affichage de la liste de solution
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Solution'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (String step in solution)
                      Text(step),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Fermer'),
                  ),
                ],
              );
            },
          );
        });
      },
      child: Text('Solution'),
    ),

    SizedBox(width: 10),
    // Ajout du Text widget pour afficher Nbcoupjoue
    Text('Nombre de coups pour gagner depuis la position initiale: $Nbcouppourgagner'),
  ],
),

          ],
        ),  
      ),
    );
  }
}