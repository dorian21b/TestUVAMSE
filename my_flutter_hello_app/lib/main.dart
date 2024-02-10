import 'package:flutter/material.dart';
/*
class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null, // null disables the button
          ),
          // Expanded expands its child
          // to fill the available space.
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
} Image.asset("assets/The_Empire_Strikes_Back_(1980_film).jpg"),

Icon(
        Icons.favorite,
        color: Colors.pink,
        size: 20.0,
      ),

IconButton(
              icon: const Icon(Icons.favorite),
              tooltip: 'Like',
              color: Colors.pink,
              onPressed: () {},
            ),

            

*/
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My first app",
            style: TextStyle(
              fontFamily: "PlayfairDisplay",
              ),
            ),
          centerTitle:true,
          backgroundColor: Colors.red[600],
        ), 
        body: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(30),
              color: Colors.blue,
              child: Text("1"),
            ),
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(30),
              color: Colors.red,
              child: Text("2"),
              ),
            
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("click"),
          onPressed: null,
          backgroundColor: Colors.red[600]
        ),
  );
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Tests>{

  int counter = 1; 
  @override
  Widget build(buildContext context) {
    return Container();
  }
}
