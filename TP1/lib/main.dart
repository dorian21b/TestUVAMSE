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
import 'package:testing_app/screens/film.dart';
import 'package:testing_app/screens/series.dart';
import 'package:testing_app/screens/docu.dart';
import 'package:testing_app/screens/home.dart';
import 'package:testing_app/screens/bd.dart';

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
        title: 'Testing Sample',
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        routerConfig: router(),
      ),
    );
  }
}
