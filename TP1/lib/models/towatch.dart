import 'package:testing_app/contenus/contenus.dart';
import 'package:flutter/material.dart';

class Towatch extends ChangeNotifier {
  final List<Contenus> _towatchItems = [];

  List<Contenus> get items => _towatchItems;

  void add(Contenus contenus) {
    _towatchItems.add(contenus);
    notifyListeners();
  }

  void remove(Contenus contenus) {
    _towatchItems.remove(contenus);
    notifyListeners();
  }
}
