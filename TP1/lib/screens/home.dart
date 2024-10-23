import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp1/screens/bd.dart';
import 'package:tp1/screens/docu.dart';
import 'package:tp1/screens/favorites.dart';
import 'package:tp1/screens/film.dart';
import 'package:tp1/screens/series.dart';
import 'package:tp1/screens/towatch.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const fullPath = '/$routeName';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) => [
              _buildPopupMenuItem(context, 'Films', FilmPage.fullPath),
              _buildPopupMenuItem(context, 'Series', SeriesPage.fullPath),
              _buildPopupMenuItem(context, 'Documentaries', DocuPage.fullPath),
              _buildPopupMenuItem(context, 'Comics/Manga', BdPage.fullPath),
              _buildPopupMenuItem(context, 'Favorites', FavoritesPage.fullPath),
              _buildPopupMenuItem(context, 'To Watch', TowatchPage.fullPath),
            ],
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
              colors: [Colors.red[50]!, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWelcomeText(),
              _buildDirectorOfTheMonth(),
              _buildMagnusOpusSection(),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      BuildContext context, String title, String route) {
    return PopupMenuItem(
      child: Text(title),
      onTap: () {
        context.go(route);
      },
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: "PlayfairDisplay",
            color: Colors.black,
          ),
          children: [
            const TextSpan(text: 'Welcome '),
            TextSpan(
              text: 'user_84',
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectorOfTheMonth() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/page_principale/Fellini.jpg',
            width: 300,
            height: 500,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Director of the Month:\n',
                    style: TextStyle(fontFamily: "PlayfairDisplay"),
                  ),
                  const TextSpan(
                    text: 'Federico Fellini',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text:
                        ' is one of the greatest Italian directors of the 20th century and one of the most illustrious filmmakers in the history of cinema.\n'
                        'He left behind works rich in satire and veiled in subtle melancholy, characterized by a dreamlike and visionary style.\n'
                        'Marked at the beginning by neorealism, Fellini\'s work evolved in the 1960s into a singular form, tied to the cinematic modernity of Europe.\n'
                        'He won the Grand Prix twice at the Moscow Film Festival (1963 and 1987), the Palme d\'Or at the Cannes Film Festival in 1960 for La dolce vita, and the David di Donatello\n'
                        'Luchino-Visconti in 1984, as well as the Golden Lion at the Venice Film Festival in 1985 and an honorary Oscar in 1993 for the entirety of his career.\n'
                        'He is also a Grand Cross Knight of the Order of Merit of the Italian Republic in 1987.',
                    style: TextStyle(fontFamily: "PlayfairDisplay"),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMagnusOpusSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Magnus Opus:',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: "PlayfairDisplay",
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildMagnusOpusImage('huitetdemi.jpg'),
                  _buildMagnusOpusImage('DolceVita.jpg'),
                  _buildMagnusOpusImage('Giuliettadeglispiriti.jpg'),
                  _buildMagnusOpusImage('NightsofCabiria.jpg'),
                  _buildMagnusOpusImage('Roma.jpg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMagnusOpusImage(String imageName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/page_principale/$imageName',
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}
