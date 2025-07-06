import 'package:flutter/material.dart';

class TechnologyPage extends StatefulWidget {
  const TechnologyPage({super.key});

  @override
  State<TechnologyPage> createState() => _TechnologyPageState();
}

class _TechnologyPageState extends State<TechnologyPage> {
  final TextEditingController searchController = TextEditingController();
  bool receiveNotifications = true;

  List<Map<String, String>> allPolls = [
    {
      'image': 'assets/images/images.jpg',
      'title': 'AI Breakthroughs',
      'subtitle': 'Vote your opinion',
    },
    {
      'image': 'assets/images/images1.jpg',
      'title': 'Future of Robotics',
      'subtitle': 'Next innovation',
    },
  ];

  List<Map<String, String>> filteredPolls = [];

  @override
  void initState() {
    super.initState();
    filteredPolls = List.from(allPolls);
    searchController.addListener(_searchPolls);
  }

  void _searchPolls() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredPolls = allPolls
          .where((poll) =>
              poll['title']!.toLowerCase().contains(query) ||
              poll['subtitle']!.toLowerCase().contains(query))
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
      appBar: AppBar(title: const Text("Technology")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search tech polls',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

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
                    subtitle: poll['subtitle']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Notifications toggle
            SwitchListTile(
              title: const Text("Receive notifications"),
              value: receiveNotifications,
              onChanged: (val) {
                setState(() {
                  receiveNotifications = val;
                });
              },
            ),

            // User Info
            _buildListTile("Phuwin Tangsakyuen", "Involved in 3 polls"),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.computer),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}

class PollCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;

  const PollCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
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
    );
  }
}
