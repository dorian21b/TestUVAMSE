import 'package:flutter/foundation.dart';

class Taquin {
  List<String> tiles_taquin;
  int size;
  int g = 0; // Coût du chemin parcouru
  int h = 0; // Estimation du coût restant
  int f = 0; // Priorité
  Taquin? parent; // Attribut parent
  int index_white = 7;

  Taquin(this.tiles_taquin, this.size, {this.g = 0, this.h = 0, this.f = 0, this.parent, this.index_white = 7}) {
    index_white = tiles_taquin.indexOf("");
    updatePriority();
  }

  Taquin copy() {
    return Taquin(
      List.from(tiles_taquin), 
      size,
      g: g,
      h: h,
      f: f,
      parent: parent,
      index_white: index_white,
    );
  }
  
  void moveUp() {
    if (index_white >= size) {
      int newIndex = index_white - size;
      String temp = tiles_taquin[index_white];
      tiles_taquin[index_white] = tiles_taquin[newIndex];
      tiles_taquin[newIndex] = temp;
      index_white = newIndex;
    }
  }

  void moveDown() {
    if (index_white < size * (size - 1)) {
      int newIndex = index_white + size;
      String temp = tiles_taquin[index_white];
      tiles_taquin[index_white] = tiles_taquin[newIndex];
      tiles_taquin[newIndex] = temp;
      index_white = newIndex;
    }
  }

  void moveLeft() {
    if (index_white % size != 0) {
      int newIndex = index_white - 1;
      String temp = tiles_taquin[index_white];
      tiles_taquin[index_white] = tiles_taquin[newIndex];
      tiles_taquin[newIndex] = temp;
      index_white = newIndex;
    }
  }

  void moveRight() {
    if ((index_white + 1) % size != 0) {
      int newIndex = index_white + 1;
      String temp = tiles_taquin[index_white];
      tiles_taquin[index_white] = tiles_taquin[newIndex];
      tiles_taquin[newIndex] = temp;
      index_white = newIndex;
    }
  }

  // Méthode pour calculer la valeur heuristique
  int heuristic() {
  int distance = 0;
  for (int i = 0; i < size * size; i++) {
    if (tiles_taquin[i] != "") {
      int currentRow = i ~/ size;
      int currentCol = i % size;
      int targetValue = int.parse(tiles_taquin[i]);
      int targetRow = targetValue ~/ size;
      int targetCol = targetValue % size;
      distance += (currentRow - targetRow).abs() + (currentCol - targetCol).abs();
    }
  }
  return distance;
}


  // Méthode pour mettre à jour la priorité
  void updatePriority() {
    h = heuristic();
    f = g + h;
    //print("f = $f");
  }

  // Redéfinition de la méthode ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Taquin && listEquals(other.tiles_taquin, this.tiles_taquin);
  }

  // Redéfinition de la méthode hashCode
  @override
  int get hashCode => tiles_taquin.hashCode;
}
