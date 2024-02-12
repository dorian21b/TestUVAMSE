import 'package:flutter/material.dart';
import 'package:tp1/contenus/contenus.dart';

class Favorites extends ChangeNotifier {
  final List<Contenus> _favoriteItems = [];

  List<Contenus> get items => _favoriteItems;

  void add(Contenus contenus) {
    _favoriteItems.add(contenus);
    notifyListeners();
  }

  void remove(Contenus contenus) {
    _favoriteItems.remove(contenus);
    notifyListeners();
  }
}


