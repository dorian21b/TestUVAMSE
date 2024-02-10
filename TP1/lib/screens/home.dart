// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/models/towatch.dart';
import 'package:testing_app/screens/towatch.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Sample'),
        actions: [
          TextButton.icon(
            onPressed: () {
              context.go(FavoritesPage.fullPath);
            },
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorites'),
          ),
          TextButton.icon(
            onPressed: () {
              context.go(TowatchPage.fullPath);
            },
            icon: const Icon(Icons.add_to_photos),
            label: const Text('To Watch'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(this.itemNo);

  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<Favorites>();
    final towatchList = context.watch<Towatch>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              key: Key('favorite_icon_$itemNo'),
              icon: favoritesList.items.contains(itemNo)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                !favoritesList.items.contains(itemNo)
                    ? favoritesList.add(itemNo)
                    : favoritesList.remove(itemNo);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(favoritesList.items.contains(itemNo)
                        ? 'Added to favorites.'
                        : 'Removed from favorites.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            IconButton(
              key: Key('towatch_icon_$itemNo'),
              icon: towatchList.items.contains(itemNo)
                  ? const Icon(Icons.add_to_photos)
                  : const Icon(Icons.add_to_photos_outlined),
              onPressed: () {
                !towatchList.items.contains(itemNo)
                    ? towatchList.add(itemNo)
                    : towatchList.remove(itemNo);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(towatchList.items.contains(itemNo)
                        ? 'Added to Watch.'
                        : 'Removed from watch.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
