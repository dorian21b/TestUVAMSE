import 'Taquin.dart';

List<Taquin> exploreNeighbors(Taquin taquin) {
  List<Taquin> neighbors_taquin = [];

  Taquin neighborUp = taquin.copy();
  neighborUp.moveUp();
  neighborUp.g += 1;
  if (taquin.index_white >= taquin.size) neighbors_taquin.add(neighborUp); // Ajouter l'état voisin à la liste s'il est différent du taquin actuel

  Taquin neighborDown = taquin.copy();
  neighborDown.moveDown();
  neighborDown.g += 1;
  if (taquin.index_white < taquin.size * (taquin.size - 1)) neighbors_taquin.add(neighborDown); // Ajouter l'état voisin à la liste s'il est différent du taquin actuel

  Taquin neighborLeft = taquin.copy();
  neighborLeft.moveLeft();
  neighborLeft.g += 1;
  if (taquin.index_white % taquin.size != 0) neighbors_taquin.add(neighborLeft); // Ajouter l'état voisin à la liste s'il est différent du taquin actuel

  Taquin neighborRight = taquin.copy();
  neighborRight.moveRight();
  neighborRight.g += 1;
  if ((taquin.index_white + 1) % taquin.size != 0) neighbors_taquin.add(neighborRight); // Ajouter l'état voisin à la liste s'il est différent du taquin actuel

  // Ajouter d'autres mouvements possibles selon votre implémentation des méthodes de déplacement dans la classe Taquin
  return neighbors_taquin;
}

class PriorityQueue {
  List<Taquin> _elements;

  PriorityQueue(this._elements);
  void add(Taquin element) {
    int index = 0;
    while (index < _elements.length && (element.f - _elements[index].f > 0)) {
      index++;
    }
    _elements.insert(index, element);
  }
  Taquin removeFirst() {
    return _elements.removeAt(0);
  }
  bool get isEmpty => _elements.isEmpty;
}

List<String> solveTaquin(Taquin initialTaquin, Taquin finalTaquin) {
  int nbcout = 0;
  Taquin copy_initialTaquin = initialTaquin.copy();
  List<String> moves = [];
  List<Taquin> closedSet = []; 

  PriorityQueue openSet = PriorityQueue([]);
  openSet.add(copy_initialTaquin);

  while (!openSet.isEmpty) {
    //nbcout = nbcout+1;
    //print(nbcout);
    Taquin current = openSet.removeFirst(); // Retirer l'état avec le coût le plus faible
    print(current.tiles_taquin);
    //print(current.f);
    closedSet.add(current); // Ajouter l'état actuel à l'ensemble des états explorés

    if (current == finalTaquin) {
      // Solution trouvée, retracer le chemin à partir de l'état final jusqu'à l'état initial
      while (current != initialTaquin) {
        print("en train de remonter");
        // Déterminer le mouvement effectué pour passer de l'état parent à l'état actuel
        Taquin? parent = current.parent;
        if (parent != null) {
          int index = current.index_white;
          //print(index);
          int parentIndex = parent.index_white;
         // print(parentIndex);
          if (index - parent.size == parentIndex) {
            moves.add("Down");
          } else if (index + parent.size == parentIndex) {
            moves.add("Up");
          } else if (index - 1 == parentIndex) {
            moves.add("Right");
          } else if (index + 1 == parentIndex) {
            moves.add("Left");
          }
        }
        
        // Passer à l'état parent
        current = parent!;
      }
      
      // Inverser la liste des mouvements pour obtenir le bon ordre
      moves = moves.reversed.toList();
      print("solution trouvées");
      return moves;
    }

    // Explorer les états voisins de l'état actuel
    List<Taquin> neighbors_taquin = exploreNeighbors(current);
    bool deja_explore;
    for (Taquin neighbor in neighbors_taquin) {
      bool deja_explore = false;
      for (int i = 0; i < closedSet.length; i++) {
        if(neighbor == closedSet[i]){
          deja_explore = true;
          break;
        }
      }
      if(!deja_explore){
        // Mettre à jour les valeurs g, h et f des états voisins
        neighbor.updatePriority();
        
        // Ajouter les états voisins à l'ensemble openSet
        openSet.add(neighbor);
        
        // Mettre à jour l'attribut parent des états voisins
        neighbor.parent = current;
      }
        
      }
    
  }
  moves = ["Non soluble"];
  return moves;
}
