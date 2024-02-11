import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/contenus/contenus.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/models/towatch.dart';
import 'package:testing_app/screens/towatch.dart';
import 'package:testing_app/screens/home.dart';


class BdPage extends StatelessWidget {
  static const routeName = 'bd_page';
  static const fullPath = '/$routeName';

  const BdPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Contenus> contenus = [
      Contenus(
        id: 70,
        title: '20th Centery Boys',
        description: 'Manga de Naoki Urasawa',
        imageUrl: 'assets/bd/20th_century_boys.jpg',
      ),
      Contenus(
        id: 71,
        title: 'Akira (1982)',
        description: 'Manga de Katsuhiro Otomo',
        imageUrl: 'assets/bd/akira.jpg',
      ),
      Contenus(
        id: 72,
        title: 'Artic Nation',
        description: 'BD franco-belge de Juan Díaz Canales et Juanjo Guarnido',
        imageUrl: 'assets/bd/arctic_nation_blacksad_tome_2.jpg',
      ),
      Contenus(
        id: 73,
        title: 'Batman the dark knight returns(1986)',
        description: 'Comics de Frank Miller',
        imageUrl: 'assets/bd/batman_the_dark_knight_returns.jpg',
      ),
      Contenus(
        id: 74,
        title: 'Bersek(1989)',
        description: 'Manga de Kentaro Miura',
        imageUrl: 'assets/bd/berserk.jpg',
      ),
      Contenus(
        id: 75,
        title: 'Calvin et Hobbes(1985)',
        description: 'Comics de Bill Watterson',
        imageUrl: 'assets/bd/calvin_et_hobbes.jpg',
      ),
      Contenus(
        id: 76,
        title: 'Death Note(2003)',
        description: 'Manga de Tsugumi oba et Takeshi Obata',
        imageUrl: 'assets/bd/death_note.jpg',
      ),
      Contenus(
        id: 77,
        title: 'Dragon ball(1984)',
        description: 'Manga de Akira Toriyama',
        imageUrl: 'assets/bd/Dragon_ball.jpg',
      ),
      Contenus(
        id: 78,
        title: 'Fullmetal Alchemist(2001)',
        description: 'Manga de Hiromu Arakawa',
        imageUrl: 'assets/bd/fullmetal_alchemist.jpg',
      ),
      Contenus(
        id: 79,
        title: 'Gaston (1957)',
        description: 'BD franco-belge de André Franquin et Jean De Mesmaeker (Jidehem)',
        imageUrl: 'assets/bd/gaston.jpg',
      ),
      Contenus(
        id: 80,
        title: 'Grasse Carcasse Blast (2009)',
        description: 'Roman graphique de Manu Larcenet',
        imageUrl: 'assets/bd/grasse_carcasse_blast_tome_1.jpg',
      ),
      Contenus(
        id: 81,
        title: 'GTO (1997)',
        description: 'Manga de Toru Fujisawa',
        imageUrl: 'assets/bd/gto.jpg',
      ),
      Contenus(
        id: 82,
        title: 'Gunnm (1990)',
        description: 'Manga de Yukito Kishiro',
        imageUrl: 'assets/bd/gunnm.jpg',
      ),
      Contenus(
        id: 83,
        title: 'Idées noires (2001)',
        description: 'BD franco-belge de André Franquin',
        imageUrl: 'assets/bd/idees_noires_integrale.jpg',
      ),
      Contenus(
        id: 84,
        title: 'Killing Joke (1988)',
        description: 'Comics de Alan Moore et Brian Bolland',
        imageUrl: 'assets/bd/killing_joke.jpg',
      ),
      Contenus(
        id: 85,
        title: 'La jeunesse de Picsou(1992)',
        description: 'Comics de Don Rosa',
        imageUrl: 'assets/bd/la_jeunesse_de_picsou.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bandes dessinées et Mangas',
          style: TextStyle(
            fontFamily: "PlayfairDisplay",
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
        itemCount: contenus.length,
        cacheExtent: 20.0,
        controller: ScrollController(),
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(contenus[index]), 
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
          width: 50, 
          height: 50, 
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(contenus.imageUrl), 
              fit: BoxFit.cover, 
            ),
          ),
        ),
        title: Text(
          contenus.title, 
          key: Key('text_${contenus.id}'), 
          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay",
                            color: Colors.black,
                        ),
        ),
        subtitle: Text(
          contenus.description, 
          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay",
                        ),
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
                    ? favoritesList.add(contenus) 
                    : favoritesList.remove(contenus); 
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
                    ? towatchList.add(contenus) 
                    : towatchList.remove(contenus); 
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