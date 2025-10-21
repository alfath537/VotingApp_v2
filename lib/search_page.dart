import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Search Results",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSerif',
                  ),
                ),
                const SizedBox(height: 16),

                // Search Bar as TextField
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // TODO: Implement search logic here
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // Trending Topics
                const Text(
                  "Trending Topics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSerif',
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      TrendingCard(
                        image: 'assets/images/images.jpg',
                        title: "Best Movie 2023",
                        subtitle: "Vote for your favorite",
                      ),
                      TrendingCard(
                        image: 'assets/images/images1.jpg',
                        title: "Tech Innovations",
                        subtitle: "Leading the future",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Leading Options
                const Text(
                  "Leading Options",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSerif',
                  ),
                ),
                const SizedBox(height: 12),
                const LeadingOption(
                  image: 'assets/images/images.jpg',
                  title: "Movie A",
                  subtitle: "45% of votes",
                ),
                const LeadingOption(
                  image: 'assets/images/images1.jpg',
                  title: "Movie B",
                  subtitle: "40% of votes",
                ),
                const LeadingOption(
                  image: 'assets/images/images.jpg',
                  title: "Movie C",
                  subtitle: "15% of votes",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TrendingCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const TrendingCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'PTSerif',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'PTSerif',
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeadingOption extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const LeadingOption({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'PTSerif',
        ),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontFamily: 'PTSerif')),
    );
  }
}
