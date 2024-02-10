
import 'package:flutter/material.dart';

class Towatch extends ChangeNotifier {
  final List<int> _towatchItems = [];

  List<int> get items => _towatchItems;

  void add(int itemNo) {
    _towatchItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _towatchItems.remove(itemNo);
    notifyListeners();
  }
}