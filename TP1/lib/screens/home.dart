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
            fontSize: 30,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.go(FilmPage.fullPath);
            },
            child: Text(
                'Films',
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.go(SeriesPage.fullPath);
            },
            child: Text(
                'Series',
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.go(DocuPage.fullPath);
            },
            child: Text(
                'Documentaires',
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                ),
            ),
          ),
          TextButton(
            onPressed: () {
              context.go(BdPage.fullPath);
            },
            child: Text(
                'Bd/Manga',
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              context.go(FavoritesPage.fullPath);
            },
            icon: const Icon(Icons.favorite_border, color: Colors.white,),
            label: const Text(
                'Favoris',
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              context.go(TowatchPage.fullPath);
            },
            icon: const Icon(Icons.add_to_photos, color: Colors.white,),
            label: const Text(
                'À regarder',
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                ),
            ),
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
                    colors: [Colors.red[50]!, Colors.white], // Couleurs du dégradé
                ),
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Texte centré en haut
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
            // Image et texte côte à côte
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    // Image à gauche
                    Image.asset(
                    'assets/page_principale/Fellini.jpg',
                    // ajustez la largeur et la hauteur selon vos besoins
                    width: 300,
                    height: 500,
                    fit: BoxFit.cover, // ajustez le style de l'image
                    ),
                    SizedBox(width: 16), // espace entre l'image et le texte
                    // Texte à droite de l'image
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
                                // Ajoutez d'autres styles au besoin, comme la couleur, la taille de la police, etc.
                                ),
                            ),
                            TextSpan(
                                text: ' was an Italian filmmaker. He is known for his distinctive style, which blends fantasy and baroque images with earthiness.\n He is recognized as one of the greatest and most influential filmmakers of all time. His films have ranked highly in critical polls such as that of Cahiers du Cinéma and Sight & Sound, which lists his 1963 film "heigth and a half" as the 10th-greatest film..',
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
            // Ligne d'images supplémentaire
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                height: 200, // hauteur fixe pour les images
                child: ListView(
                    scrollDirection: Axis.horizontal, // défilement horizontal
                    children: [
                    // première image
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                        'assets/page_principale/huitetdemi.jpg',
                        width: 150,
                        fit: BoxFit.cover,
                        ),
                    ),
                    // deuxième image
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

//'assets/page_principale/Fellini.jpg',