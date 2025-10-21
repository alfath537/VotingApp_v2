import 'package:flutter/material.dart';

class TopTVShowsPage extends StatelessWidget {
  const TopTVShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Top TV Shows",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildShowCard(
                    "Breaking Bad",
                    "Vote for the best drama",
                    "assets/images/breaking_bad.jpg",
                  ),
                  const SizedBox(width: 12),
                  _buildShowCard(
                    "Stranger Things",
                    "Choose your favorite",
                    "assets/images/stranger_things.jpg",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Current Leaders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildVotingTile(
              "Breaking Bad",
              "45% votes",
              "assets/images/breaking_bad.jpg",
            ),
            _buildVotingTile(
              "Stranger Things",
              "30% votes",
              "assets/images/stranger_things.jpg",
            ),
            _buildVotingTile(
              "Game of Thrones",
              "25% votes",
              "assets/images/game_of_thrones.jpg",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: Add action
        },
      ),
    );
  }

  Widget _buildShowCard(String title, String subtitle, String imagePath) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imagePath, fit: BoxFit.cover),
          Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVotingTile(String title, String subtitle, String imagePath) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
    );
  }
}
