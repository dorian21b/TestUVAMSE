import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/contenus/contenus.dart';
import 'package:testing_app/models/towatch.dart';

class TowatchPage extends StatelessWidget {
  static const routeName = 'towatch_page';
  static const fullPath = '/$routeName';

  const TowatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Towatch'),
      ),
      body: Consumer<Towatch>(
        builder: (context, value, child) => value.items.isNotEmpty
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) =>
                    TowatchItemTile(value.items[index]),
              )
            : const Center(
                child: Text('No films added.'),
              ),
      ),
    );
  }
}


class TowatchItemTile extends StatelessWidget {
  final Contenus contenus;

  const TowatchItemTile(this.contenus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 50, // Ajustez la largeur selon vos besoins
          height: 50, // Ajustez la hauteur selon vos besoins
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(contenus.imageUrl), // Utilisez l'image du film
              fit: BoxFit.cover, // Ajustez le style de l'image
            ),
          ),
        ),
        title: Text(
          contenus.title,
          key: Key('towatch_text_${contenus.id}'),
        ),
        subtitle: Text(
          contenus.description,
          key: Key('towatch_description_${contenus.id}'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_${contenus.id}'),
          icon: const Icon(Icons.close),
          onPressed: () {
            context.read<Towatch>().remove(contenus);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Removed from towatch.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}