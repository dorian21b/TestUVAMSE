import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tp1/contenus/contenus.dart';
import 'package:tp1/models/favorites.dart';
import 'package:tp1/screens/favorites.dart';
import 'package:tp1/models/towatch.dart';
import 'package:tp1/screens/towatch.dart';
import 'package:tp1/screens/home.dart';

class FilmPage extends StatelessWidget {
  static const routeName = 'film_page';
  static const fullPath = '/$routeName';

  const FilmPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Contenus> contenus = [
      Contenus(
        id: 1,
        title: 'Star Wars 4',
        description: 'George Lucas',
        imageUrl: 'assets/films/StarWarsMoviePoster1977.jpg',
      ),
      Contenus(
        id: 2,
        title: 'Star Wars 5',
        description: 'George Lucas',
        imageUrl: 'assets/films/The_Empire_Strikes_Back_(1980_film).jpg',
      ),
      Contenus(
        id: 3,
        title: 'Star Wars 6',
        description: 'George Lucas',
        imageUrl: 'assets/films/ReturnOfTheJediPoster1983.jpg',
      ),
      Contenus(
        id: 4,
        title: 'Casablanca',
        description: 'Michael Curtiz',
        imageUrl: 'assets/films/Casablanca.jpg',
      ),
      Contenus(
        id: 5,
        title: 'Citizen Kane',
        description: 'Orson Welles',
        imageUrl: 'assets/films/CitizenKane.jpg',
      ),
      Contenus(
        id: 6,
        title: 'Do the Right Thing',
        description: 'Spike Lee',
        imageUrl: 'assets/films/DoTheRightThing.jpg',
      ),
      Contenus(
        id: 7,
        title: 'For a Few Dollars More',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/Fewdollars.jpg',
      ),
      Contenus(
        id: 8,
        title: 'Goodfellas',
        description: 'Martin Scorsese',
        imageUrl: 'assets/films/Goodfellas.jpg',
      ),
      Contenus(
        id: 9,
        title: 'Harakiri',
        description: 'Masaki Kobayashi',
        imageUrl: 'assets/films/Harakiri.jpg',
      ),
      Contenus(
        id: 10,
        title: 'In the Mood for Love',
        description: 'Wong Kar Wai',
        imageUrl: 'assets/films/InTheMoodForLove.jpg',
      ),
      Contenus(
        id: 11,
        title: 'M',
        description: 'Fritz Lang',
        imageUrl: 'assets/films/MLeMaudit.jpg',
      ),
      Contenus(
        id: 12,
        title: 'Once Upon a Time in America',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/OnceUponaTimeinAmerica.jpg',
      ),
      Contenus(
        id: 13,
        title: 'Once Upon a Time in Hollywood',
        description: 'Quentin Tarantino',
        imageUrl: 'assets/films/OnceUponaTimeinHollywood.jpg',
      ),
      Contenus(
        id: 14,
        title: 'Once Upon a Time in the West',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/OnceUponaTimeintheWest.jpg',
      ),
      Contenus(
        id: 15,
        title: 'Once Upon a Time ... the Revolution',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/OnceUponaTimeRevolution.jpg',
      ),
      Contenus(
        id: 16,
        title: 'The Godfather 1',
        description: 'Francis Ford Coppola',
        imageUrl: 'assets/films/Parrain1.jpg',
      ),
      Contenus(
        id: 17,
        title: 'The Godfather 2',
        description: 'Francis Ford Coppola',
        imageUrl: 'assets/films/Parrain2.jpg',
      ),
      Contenus(
        id: 18,
        title: 'Platoon',
        description: 'Oliver Stone',
        imageUrl: 'assets/films/Platoon.jpg',
      ),
      Contenus(
        id: 19,
        title: 'Psycho',
        description: 'Alfred Hitchcock',
        imageUrl: 'assets/films/Pshycho.jpg',
      ),
      Contenus(
        id: 20,
        title: 'Ran',
        description: 'Akira Kurosawa',
        imageUrl: 'assets/films/Ran.jpg',
      ),
      Contenus(
        id: 21,
        title: 'Taxi Driver',
        description: 'Martin Scorsese',
        imageUrl: 'assets/films/Taxidriver.jpg',
      ),
      Contenus(
        id: 22,
        title: 'The Good, the Bad and the Ugly',
        description: 'Sergio Leone',
        imageUrl: 'assets/films/TheGoodBadUgly.jpg',
      ),
      Contenus(
        id: 23,
        title: 'Twin Peaks',
        description: 'David Lynch, Lesli Linka Glatter, Caleb Deschanel',
        imageUrl: 'assets/films/TwinPeaks.jpg',
      ),
      Contenus(
        id: 24,
        title: 'Vertigo',
        description: 'Alfred Hitchcock',
        imageUrl: 'assets/films/Vertigo.jpg',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Films',
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
                        : 'Removed from Watch.'),
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
