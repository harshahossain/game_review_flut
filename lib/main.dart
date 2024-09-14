
import 'package:flutter/material.dart';
import 'add_game_page.dart'; 

void main() {
  runApp(GameReviewApp()); 
}

class GameReviewApp extends StatelessWidget {
  const GameReviewApp({super.key});
  // This should match the name above
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Review App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Reviews'),
      ),
      body: GameList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddGamePage()),  // Ensure navigation to AddGamePage is correct
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class GameList extends StatelessWidget {
  final List<GameReview> games = [
    GameReview(name: 'The Witcher 3', rating: 5, review: 'Amazing open-world RPG with great story!'),
    GameReview(name: 'Cyberpunk 2077', rating: 4, review: 'Good game, but had some bugs at launch.'),
    GameReview(name: 'Minecraft', rating: 5, review: 'Creative and fun for all ages.'),
  ];

  GameList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(games[index].name),
          subtitle: Text('Rating: ${games[index].rating}/5\n${games[index].review}'),
          trailing: const Icon(Icons.star, color: Colors.amber),
        );
      },
    );
  }
}

class GameReview {
  final String name;
  final int rating;
  final String review;

  GameReview({required this.name, required this.rating, required this.review});
}
