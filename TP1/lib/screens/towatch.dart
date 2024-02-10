import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  final int itemNo;

  const TowatchItemTile(this.itemNo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('towatch_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: const Icon(Icons.close),
          onPressed: () {
            context.read<Towatch>().remove(itemNo);
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