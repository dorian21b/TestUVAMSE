import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1/contenus/contenus.dart';
import 'package:tp1/models/favorites.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = 'favorites_page';
  static const fullPath = '/$routeName';

  const FavoritesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vos Favoris',
          style: TextStyle(                        
                fontFamily: "PlayfairDisplay",
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Consumer<Favorites>(
        builder: (context, value, child) => value.items.isNotEmpty
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemExtent: 500, 
                itemBuilder: (context, index) =>
                    FavoriteItemTile(value.items[index]),
              )
            : const Center(
                child: Text('No favorites added.'),
              ),
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final Contenus contenus;

  const FavoriteItemTile(this.contenus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          key: Key('favorites_text_${contenus.id}'),
          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay",
                            color: Colors.black,
                        ),
        ),
        subtitle: Text(
          contenus.description,
          key: Key('favorites_description_${contenus.id}'),
          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay",
                        ),
        ),
        trailing: IconButton(
          key: Key('remove_icon_${contenus.id}'),
          icon: const Icon(Icons.close),
          onPressed: () {
            context.read<Favorites>().remove(contenus);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
