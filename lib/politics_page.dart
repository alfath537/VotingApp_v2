import 'package:flutter/material.dart';

class PoliticsPage extends StatefulWidget {
  const PoliticsPage({super.key});

  @override
  State<PoliticsPage> createState() => _PoliticsPageState();
}

class _PoliticsPageState extends State<PoliticsPage> {
  final TextEditingController searchController = TextEditingController();
  List<Map<String, String>> allPolls = [
    {
      'image': 'assets/images/images.jpg',
      'title': 'Local Election',
      'subtitle': 'Vote in your region',
    },
    {
      'image': 'assets/images/images1.jpg',
      'title': 'Policy Debate',
      'subtitle': 'Choose a side',
    },
    {
      'image': 'assets/images/images1.jpg',
      'title': 'New Bill Voting',
      'subtitle': 'Support or reject',
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
      appBar: AppBar(title: const Text("Politics")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Search bar
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search polls',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Featured Polls",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  PollCard(
                    image: "assets/images/images.jpg",
                    title: "Election 2024",
                    subtitle: "Vote your candidate",
                  ),
                  PollCard(
                    image: "assets/images/images1.jpg",
                    title: "Policy Change",
                    subtitle: "Make your voice heard",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Recent Polls",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            ...filteredPolls.map((poll) => _buildListTile(
                  image: poll['image']!,
                  title: poll['title']!,
                  subtitle: poll['subtitle']!,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const SaveIcon(),
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
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withAlpha((0.6 * 255).toInt()),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Text info
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Save icon
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

class SaveIcon extends StatefulWidget {
  const SaveIcon({super.key});

  @override
  State<SaveIcon> createState() => _SaveIconState();
}

class _SaveIconState extends State<SaveIcon> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
      onPressed: () {
        setState(() {
          isSaved = !isSaved;
        });
      },
    );
  }
}
