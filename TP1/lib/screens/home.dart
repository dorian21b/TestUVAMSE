import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/contenus/contenus.dart';
import 'package:tp1/models/favorites.dart';
import 'package:tp1/screens/favorites.dart';
import 'package:tp1/models/towatch.dart';
import 'package:tp1/screens/towatch.dart';
import 'package:tp1/screens/film.dart';
import 'package:tp1/screens/series.dart';
import 'package:tp1/screens/docu.dart';
import 'package:tp1/screens/bd.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const fullPath = '/$routeName';

  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'POPBOX',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
            fontSize: 30,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text('Films'),
                onTap: () {
                  context.go(FilmPage.fullPath);
                },
              ),
              PopupMenuItem(
                child: Text('Series'),
                onTap: () {
                  context.go(SeriesPage.fullPath);
                },
              ),
              PopupMenuItem(
                child: Text('Documentaires'),
                onTap: () {
                  context.go(DocuPage.fullPath);
                },
              ),
              PopupMenuItem(
                child: Text('Bd/Manga'),
                onTap: () {
                  context.go(BdPage.fullPath);
                },
              ),
              PopupMenuItem(
                child: Text('Favoris'),
                onTap: () {
                  context.go(FavoritesPage.fullPath);
                },
              ),
              PopupMenuItem(
                child: Text('À regarder'),
                onTap: () {
                  context.go(TowatchPage.fullPath);
                },
              ),
            ],
          ),
        ],
        backgroundColor: Colors.red[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red[50]!, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PlayfairDisplay",
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: 'Bienvenue '),
                      TextSpan(
                        text: 'user_84',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/page_principale/Fellini.jpg',
                      width: 300,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Le réalisateur du Mois:\n',
                              style: TextStyle(
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),
                            TextSpan(
                              text: 'Federico Fellini',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' est l\'un des plus grands réalisateurs italiens du xxe siècle et l\'un des cinéastes les plus illustres de l\'histoire du cinéma.\n'
                                  'Il a laissé derrière lui des œuvres riches en satire et voilées d\'une subtile mélancolie, caractérisées par un style onirique et visionnaire.\n'
                                  'Marquée à ses débuts par le néoréalisme, l\'œuvre de Fellini évolue, dans les années 1960, vers une forme singulière, liée à la modernité cinématographique européenne.\n'
                                  'Il a remporté deux fois le Grand Prix au Festival du film de Moscou (1963 et 1987), la Palme d\'or au Festival de Cannes 1960 pour La dolce vita et le David di Donatello \n'
                                  'Luchino-Visconti 1984 ainsi que le Lion d\'or à la Mostra de Venise 1985 et l\'Oscar d\'honneur en 1993 pour l\'ensemble de sa carrière. \n'
                                  'Il est également Chevalier grand-croix au grand cordon de l\'Ordre du Mérite de la République italienne en 1987 ',
                              style: TextStyle(
                                fontFamily: "PlayfairDisplay",
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Magnus opus:',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontFamily: "PlayfairDisplay",
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/page_principale/huitetdemi.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/page_principale/DolceVita.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/page_principale/Giuliettadeglispiriti.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/page_principale/NightsofCabiria.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/page_principale/Roma.jpg',
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
