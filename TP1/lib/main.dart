import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/models/favorites.dart';
import 'package:tp1/screens/favorites.dart';
import 'package:tp1/models/towatch.dart';
import 'package:tp1/screens/towatch.dart';
import 'package:tp1/screens/film.dart';
import 'package:tp1/screens/series.dart';
import 'package:tp1/screens/docu.dart';
import 'package:tp1/screens/home.dart';
import 'package:tp1/screens/bd.dart';

void main() {
  runApp(const TestingApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: FilmPage.routeName,
            builder: (context, state) => const FilmPage(),
          ),
          GoRoute(
            path: SeriesPage.routeName,
            builder: (context, state) => const SeriesPage(),
          ),
          GoRoute(
            path: DocuPage.routeName,
            builder: (context, state) => const DocuPage(),
          ),
          GoRoute(
            path: BdPage.routeName,
            builder: (context, state) => const BdPage(),
          ),
          GoRoute(
            path: FavoritesPage.routeName,
            builder: (context, state) => const FavoritesPage(),
          ),
          GoRoute(
            path: TowatchPage.routeName,
            builder: (context, state) => const TowatchPage(),
          ),
        ],
      ),
    ],
  );
}


class TestingApp extends StatelessWidget {
  const TestingApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Favorites>(
          create: (context) => Favorites(),
        ),
        ChangeNotifierProvider<Towatch>(
          create: (context) => Towatch(),
        ),
      ],
      child: MaterialApp.router(
        title: 'TP 1 ',
        theme: ThemeData(
          colorSchemeSeed: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        routerConfig: router(),
      ),
    );
  }
}
