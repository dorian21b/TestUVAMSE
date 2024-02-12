import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1/contenus/contenus.dart';
import 'package:tp1/models/towatch.dart';

class TowatchPage extends StatelessWidget {
  static const routeName = 'towatch_page';
  static const fullPath = '/$routeName';

  const TowatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'À regarder',
          style: TextStyle(                        
                fontFamily: "PlayfairDisplay",
          ),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Consumer<Towatch>(
        builder: (context, value, child) => value.items.isNotEmpty
            ? ListView.builder(
                itemCount: value.items.length,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemExtent: 500, 
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
          key: Key('towatch_text_${contenus.id}'),
          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "PlayfairDisplay",
                            color: Colors.black,
                        ),
        ),
        subtitle: Text(
          contenus.description,
          key: Key('towatch_description_${contenus.id}'),
          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "PlayfairDisplay",
                        ),
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