import 'package:flutter/material.dart';

class HealthPage extends StatefulWidget {
  const HealthPage({super.key});

  @override
  State<HealthPage> createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> allPolls = [
    {
      'image': 'assets/images/images.jpg',
      'title': 'Healthy Living Tips',
    },
    {
      'image': 'assets/images/images1.jpg',
      'title': 'Mental Health Awareness',
    },
  ];

  List<Map<String, String>> filteredPolls = [];

  @override
  void initState() {
    super.initState();
    filteredPolls = List.from(allPolls);
    searchController.addListener(_filterPolls);
  }

  void _filterPolls() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredPolls = allPolls
          .where((poll) => poll['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Health"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        color: const Color(0xFFF9F6FC),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Search Bar
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search health polls',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // Featured Polls
              const Text(
                "Featured Polls",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredPolls.length,
                  itemBuilder: (context, index) {
                    var poll = filteredPolls[index];
                    return PollCard(
                      image: poll['image']!,
                      title: poll['title']!,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Recent Polls
              const Text(
                "Recent Polls",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildMiniPoll(
                "assets/images/images.jpg",
                "Vegan Diet Benefits",
                "Explore plant-based nutrition",
              ),
              _buildMiniPoll(
                "assets/images/images1.jpg",
                "Exercise Routines",
                "Best practices for beginners",
              ),
              _buildMiniPoll(
                "assets/images/images.jpg",
                "Mental Health",
                "Importance of mental well-being",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiniPoll(String image, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}

class PollCard extends StatefulWidget {
  final String image;
  final String title;

  const PollCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(widget.image, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha((0.6 * 255).toInt()),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'PTSerif',
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isSaved = !isSaved;
                  });
                },
                child: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
