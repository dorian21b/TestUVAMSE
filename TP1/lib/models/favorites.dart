// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:testing_app/contenus/contenus.dart';

/// The [Favorites] class holds a list of favorite items saved by the user.
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


