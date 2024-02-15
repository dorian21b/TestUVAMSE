import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/classes/classe_exercice.dart';

class Tile {
  String path;
  Alignment alignment;

  Tile({required this.path, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.33, // 1/2 pour 2 par 2, 1/3 pour une grille de 3 etc..
            heightFactor: 0.33,
            child: Image.asset(this.path),
          ),
        ),
      ),
    );
  }
}

List<Tile> twoTiles = [
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(-1, -1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(1, -1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(-1, 1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(1, 1)),
];

List<Tile> threeTiles = [
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(-1, -1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(0, -1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(1, -1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(-1, 0)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(0, 0)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(1, 0)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(-1, 1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(0, 1)),
  Tile(path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(1, 1)),
];

class Ex5b extends StatelessWidget {
  final Exercice exercice;

  const Ex5b({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tile> tiles = threeTiles; 

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 5b: génération du plateau de tuiles d\'une image',
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
            primary: false,
            padding: const EdgeInsets.all(5),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 3,
            children: List.generate(tiles.length, (index) {
              return Container(
                padding: const EdgeInsets.all(2),
                child: tiles[index].croppedImageTile(),
              );
            }),
          ),
        ),
      ),
    );
  }
}
