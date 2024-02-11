// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/contenus/contenus.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/models/towatch.dart';
import 'package:testing_app/screens/towatch.dart';
import 'package:testing_app/screens/home.dart';


class DocuPage extends StatelessWidget {
  static const routeName = 'docu_page';
  static const fullPath = '/$routeName';

  const DocuPage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Créez une liste de films factice pour le démonstration
    final List<Contenus> contenus = [
      Contenus(
        id: 50,
        title: 'Black Fish',
        description: 'Description of Contenus 1',
        imageUrl: 'assets/docu/BlackFish.jpg',
      ),
      Contenus(
        id: 51,
        title: 'Cosmos',
        description: 'Description of Contenus 2',
        imageUrl: 'assets/docu/Cosmos.jpg',
      ),
      Contenus(
        id: 52,
        title: 'Etugen',
        description: 'Description of Contenus 3',
        imageUrl: 'assets/docu/Etugen.jpg',
      ),
      // Ajoutez plus de films ici selon vos besoins
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POPBOX',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
          ),
        ),
        /*actions: [
          TextButton.icon(
            onPressed: () {
              context.go(HomePage.fullPath);
            },
            icon: const Icon(Icons.home),
            label: const Text('Home'),
          ),
          TextButton(
            onPressed: () {
              //context.go(FilmPage.fullPath);
            },
            child: Text('Films'),
          ),
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
        ],*/
        backgroundColor: Colors.red[600],
      ),
      body: ListView.builder(
        itemCount: contenus.length, // Utilisez la longueur de la liste de films
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(contenus[index]), // Utilisez chaque film à l'index actuel
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Contenus contenus;

  const ItemTile(this.contenus);

  @override
  Widget build(BuildContext context) {
    final favoritesList = context.watch<Favorites>();
    final towatchList = context.watch<Towatch>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 50, // Ajustez la largeur selon vos besoins
          height: 50, // Ajustez la hauteur selon vos besoins
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(contenus.imageUrl), // Utilisez l'image du film
              fit: BoxFit.cover, // Ajustez le style de l'image
            ),
          ),
        ),
        title: Text(
          contenus.title, // Utilisez le titre du film
          key: Key('text_${contenus.id}'), // Utilisez l'ID du film pour la clé
        ),
        subtitle: Text(
          contenus.description, // Utilisez la description du film
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              key: Key('favorite_icon_${contenus.id}'),
              icon: favoritesList.items.contains(contenus)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                !favoritesList.items.contains(contenus)
                    ? favoritesList.add(contenus) // Passer le film lui-même
                    : favoritesList.remove(contenus); // Passer le film lui-même
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(favoritesList.items.contains(contenus)
                        ? 'Added to favorites.'
                        : 'Removed from favorites.'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            IconButton(
              key: Key('towatch_icon_${contenus.id}'),
              icon: towatchList.items.contains(contenus)
                  ? const Icon(Icons.add_to_photos)
                  : const Icon(Icons.add_to_photos_outlined),
              onPressed: () {
                !towatchList.items.contains(contenus)
                    ? towatchList.add(contenus) // Passer le film lui-même
                    : towatchList.remove(contenus); // Passer le film lui-même
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(towatchList.items.contains(contenus)
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