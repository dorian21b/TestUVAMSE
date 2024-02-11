import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/contenus/contenus.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/models/towatch.dart';
import 'package:testing_app/screens/towatch.dart';
import 'package:testing_app/screens/film.dart';
import 'package:testing_app/screens/series.dart';
import 'package:testing_app/screens/docu.dart';
import 'package:testing_app/screens/bd.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const fullPath = '/$routeName';

  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    // Créez une liste de films factice pour le démonstration   
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POPBOX',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.go(FilmPage.fullPath);
            },
            child: Text('Films'),
          ),
          TextButton(
            onPressed: () {
              context.go(SeriesPage.fullPath);
            },
            child: Text('Series'),
          ),
          TextButton(
            onPressed: () {
              context.go(DocuPage.fullPath);
            },
            child: Text('Documentaires'),
          ),
          TextButton(
            onPressed: () {
              context.go(BdPage.fullPath);
            },
            child: Text('Bd/Manga'),
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
        ],
        backgroundColor: Colors.red[600],
      ),
    );
  }
}