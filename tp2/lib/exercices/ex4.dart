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
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.asset(this.path),
          ),
        ),
      ),
    );
  }
}

Tile tile = new Tile(
    path: 'assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg', alignment: Alignment(0, 0));

class Ex4 extends StatelessWidget {
  final Exercice exercice;

  const Ex4({Key? key, required this.exercice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exercice 4: Affichage d\'une tuile (un morceau d\'image)',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          children: [
            SizedBox(
              width: 150.0,
              height: 150.0,
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: createTileWidget(),
              ),
            ),
            Container(
              height: 200,
              child: Image.asset('assets/Salvador_Dali_A_(Dali_Atomicus)_09633u.jpg',
                  fit: BoxFit.cover),
            ),
          ],
        ),
        ),
      ),
    );
  }
  Widget createTileWidget() {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
