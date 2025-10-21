import 'package:flutter/material.dart';
import 'movie_vote_page.dart';

/// Backend simulasi untuk saved polls
class SavedBackend {
  static final Map<String, bool> _savedStatus = {
    "Best Movie 2023": true,
    "Tech Innovations": true,
    "Health Tips": true,
    "Top TV Shows": false,
    "Favorite Tech Brand": false,
  };

  static bool isSaved(String title) => _savedStatus[title] ?? false;

  static void toggleSaved(String title) {
    _savedStatus[title] = !(_savedStatus[title] ?? false);
  }

  static Map<String, bool> getAllSaved() => _savedStatus;
}

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> allItems = [];
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    allItems = [
      {
        'image': 'assets/images/images.jpg',
        'title': "Best Movie 2023",
        'subtitle': "Vote for your favorite movie",
        'category': 'Saved',
      },
      {
        'image': 'assets/images/images1.jpg',
        'title': "Tech Innovations",
        'subtitle': "Latest trends in technology",
        'category': 'Saved',
      },
      {
        'image': 'assets/images/images.jpg',
        'title': "Health Tips",
        'subtitle': "Stay healthy with these tips",
        'category': 'Saved',
      },
      {
        'image': 'assets/images/images1.jpg',
        'title': "Top TV Shows",
        'subtitle': "What are you watching lately?",
        'category': 'Recent Votes',
      },
      {
        'image': 'assets/images/images.jpg',
        'title': "Favorite Tech Brand",
        'subtitle': "Vote your top tech company",
        'category': 'Recent Votes',
      },
    ];
    filteredItems = List.from(allItems);
    searchController.addListener(_filterItems);
  }

  void _filterItems() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = allItems.where((item) {
        return item['title'].toLowerCase().contains(query);
      }).toList();
    });
  }

  void toggleSave(String title) {
    setState(() {
      SavedBackend.toggleSaved(title);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> saved = filteredItems
        .where((item) => item['category'] == 'Saved')
        .toList();
    List<Map<String, dynamic>> recent = filteredItems
        .where((item) => item['category'] == 'Recent Votes')
        .toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Saved Polls",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PTSerif',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search saved polls',
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
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              if (saved.isNotEmpty)
                const Text(
                  "Saved",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PTSerif',
                  ),
                ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    ...saved.map((item) => SavedItem(
                          image: item['image'],
                          title: item['title'],
                          subtitle: item['subtitle'],
                          saved: SavedBackend.isSaved(item['title']),
                          onTap: item['title'] == "Best Movie 2023"
                              ? () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MovieVotePage(),
                                    ),
                                  );
                                }
                              : null,
                          onSaveToggle: () => toggleSave(item['title']),
                        )),
                    const SizedBox(height: 30),
                    if (recent.isNotEmpty)
                      const Text(
                        "Recent Votes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PTSerif',
                        ),
                      ),
                    const SizedBox(height: 10),
                    ...recent.map((item) => SavedItem(
                          image: item['image'],
                          title: item['title'],
                          subtitle: item['subtitle'],
                          saved: SavedBackend.isSaved(item['title']),
                          onSaveToggle: () => toggleSave(item['title']),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool saved;
  final VoidCallback onSaveToggle;

  const SavedItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
    required this.saved,
    required this.onSaveToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PTSerif',
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'PTSerif',
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                saved ? Icons.bookmark : Icons.bookmark_border,
                color: saved ? Colors.blue : Colors.grey,
              ),
              onPressed: onSaveToggle,
            ),
          ],
        ),
      ),
    );
  }
}
