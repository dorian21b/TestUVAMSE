import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/contenus/contenus.dart';
import 'package:tp1/models/favorites.dart';
import 'package:tp1/screens/favorites.dart';
import 'package:tp1/models/towatch.dart';
import 'package:tp1/screens/towatch.dart';
import 'package:tp1/screens/home.dart';


class SeriesPage extends StatelessWidget {
  static const routeName = 'series_page';
  static const fullPath = '/$routeName';

  const SeriesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Contenus> contenus = [
      Contenus(
        id: 31,
        title: 'Black Mirror',
        description: 'David Slade',
        imageUrl: 'assets/series/BlackMirror.jpg',
      ),
      Contenus(
        id: 32,
        title: 'Breaking Bad',
        description: 'Vince Gilligan',
        imageUrl: 'assets/series/BreakingBad.jpg',
      ),
      Contenus(
        id: 33,
        title: 'Chernobyl',
        description: 'Johan Renck',
        imageUrl: 'assets/series/Chernobyl.jpg',
      ),
      Contenus(
        id: 34,
        title: 'Downton Abbey',
        description: 'Michael Engler',
        imageUrl: 'assets/series/DowntownAbbey.jpg',
      ),
      Contenus(
        id: 35,
        title: 'Godless',
        description: 'Scott Frank',
        imageUrl: 'assets/series/Godless.jpg',
      ),
      Contenus(
        id: 36,
        title: '1883',
        description: 'Taylor Shéridan',
        imageUrl: 'assets/series/Millehuitcentquatrevingttrois.jpg',
      ),
      Contenus(
        id: 37,
        title: 'MindHunter',
        description: 'David Fincher',
        imageUrl: 'assets/series/MindHunter.jpg',
      ),
      Contenus(
        id: 38,
        title: 'Peaky Blinders',
        description: 'Steven Knight',
        imageUrl: 'assets/series/PeakyBlinders.jpg',
      ),
      Contenus(
        id: 39,
        title: 'Queen\'s gambit',
        description: 'Allan Scott et Scott Frank',
        imageUrl: 'assets/series/QueenGambit.jpg',
      ),
      Contenus(
        id: 40,
        title: 'Sambre',
        description: 'Jean Xavier de Lestrade',
        imageUrl: 'assets/series/Sambre.jpg',
      ),
      Contenus(
        id: 40,
        title: 'Severance',
        description: 'Ben Stiller et Aoife McArdle',
        imageUrl: 'assets/series/Severance.jpg',
      ),
      Contenus(
        id: 41,
        title: 'Sherlock',
        description: 'Steven Moffat et Mark Gatiss ',
        imageUrl: 'assets/series/Sherlock.jpg',
      ),
      Contenus(
        id: 42,
        title: 'The Sopranos',
        description: ' Tim Van Patten, John Patterson, Allen Coulter et Alan Taylor',
        imageUrl: 'assets/series/Sopranos.jpg',
      ),
      Contenus(
        id: 43,
        title: 'The Boys',
        description: 'Eric Kripke',
        imageUrl: 'assets/series/TheBoys.jpg',
      ),
      Contenus(
        id: 44,
        title: 'True Detective',
        description: 'Cary Fukunaga',
        imageUrl: 'assets/series/TrueDetective.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Séries',
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