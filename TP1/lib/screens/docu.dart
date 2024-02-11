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
    final List<Contenus> contenus = [
      Contenus(
        id: 50,
        title: 'Black Fish',
        description: 'Gabriela Cowperthwaite',
        imageUrl: 'assets/docu/BlackFish.jpg',
      ),
      Contenus(
        id: 51,
        title: 'Cosmos',
        description: 'AD.Ann Druyan, BB.Brannon Braga, BP.Bill Pope.',
        imageUrl: 'assets/docu/Cosmos.jpg',
      ),
      Contenus(
        id: 52,
        title: 'Etugen',
        description: 'Arnaud Riou',
        imageUrl: 'assets/docu/Etugen.jpg',
      ),
      Contenus(
        id: 53,
        title: 'Made in America',
        description: 'Ezra Edelman',
        imageUrl: 'assets/docu/MadeInAmerica.jpg',
      ),
      Contenus(
        id: 54,
        title: 'Our Planet',
        description: 'Alastair Fothergill',
        imageUrl: 'assets/docu/OurPlanet.jpg',
      ),
      Contenus(
        id: 55,
        title: 'Planet Earth',
        description: 'David Attenborough',
        imageUrl: 'assets/docu/PlanetEarth.jpg',
      ),
      Contenus(
        id: 56,
        title: 'Radiohead In Rainbows, From The Basement',
        description: 'Benjamin Clavel',
        imageUrl: 'assets/docu/RadioHead.jpg',
      ),
      Contenus(
        id: 57,
        title: 'Sacerdoce',
        description: 'Damien Boyer',
        imageUrl: 'assets/docu/Sacerdoce.jpg',
      ),
      Contenus(
        id: 58,
        title: 'Stop Making Sense',
        description: 'Jonathan Demme',
        imageUrl: 'assets/docu/StopMakingSense.jpg',
      ),
      Contenus(
        id: 59,
        title: 'Sugar Man (Searching for Sugar Man)',
        description: 'Malik Bendjelloul',
        imageUrl: 'assets/docu/SugarMan.jpg',
      ),
      Contenus(
        id: 60,
        title: 'Suspendu, Des soignants entre deux mondes',
        description: 'Fabien Moine',
        imageUrl: 'assets/docu/Suspendus.jpg',
      ),
      Contenus(
        id: 61,
        title: 'The Wire',
        description: 'Tiha K.Gudac',
        imageUrl: 'assets/docu/TheWire.jpg',
      ),
      Contenus(
        id: 62,
        title: 'Le Monde en guerre',
        description: 'David Elstein',
        imageUrl: 'assets/docu/TheWorldAtWar.jpg',
      ),
      Contenus(
        id: 63,
        title: 'Tous résistants dans l’âme',
        description: 'Stephane Chatry',
        imageUrl: 'assets/docu/Tousresistants.jpg',
      ),
      
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Documentaires',
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