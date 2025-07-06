import 'package:flutter/material.dart';

class EntertainmentPage extends StatefulWidget {
  const EntertainmentPage({super.key});

  @override
  State<EntertainmentPage> createState() => _EntertainmentPageState();
}

class _EntertainmentPageState extends State<EntertainmentPage> {
  final TextEditingController searchController = TextEditingController();
  bool receiveNotifications = false;

  List<Map<String, String>> allPolls = [
    {
      'image': 'assets/images/images.jpg',
      'title': 'Oscars 2023',
      'subtitle': 'Nominate your choice',
    },
    {
      'image': 'assets/images/images1.jpg',
      'title': 'Grammy Awards',
      'subtitle': 'Vote for the best album',
    },
    {
      'image': 'assets/images/images.jpg',
      'title': 'Emmy Awards',
      'subtitle': 'Select your favorite show',
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
      appBar: AppBar(
        title: const Text("Entertainment"),
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
                  hintText: 'Search entertainment polls',
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PollCard(
                      image: "assets/images/images.jpg",
                      title: "Best Movie 2023",
                    ),
                    PollCard(
                      image: "assets/images/images1.jpg",
                      title: "Top TV Shows",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Popular Polls
              const Text(
                "Popular Polls",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              ...filteredPolls.map((poll) => MiniPoll(
                    image: poll['image']!,
                    title: poll['title']!,
                    subtitle: poll['subtitle']!,
                  )),

              const SizedBox(height: 24),

              // Upcoming Polls
              const Text(
                "Upcoming Polls",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildListTile("Film Festival", "Starts in 3 days"),
              _buildListTile("Music Fest", "Opens next week"),

              const SizedBox(height: 24),

              // Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Receive notifications",
                    style: TextStyle(fontSize: 16, fontFamily: 'PTSerif'),
                  ),
                  Switch(
                    value: receiveNotifications,
                    onChanged: (val) {
                      setState(() {
                        receiveNotifications = val;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.movie_filter),
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
                  fontFamily: 'PTSerif',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
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

class MiniPoll extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;

  const MiniPoll({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  State<MiniPoll> createState() => _MiniPollState();
}

class _MiniPollState extends State<MiniPoll> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(widget.image, width: 50, height: 50, fit: BoxFit.cover),
      ),
      title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(widget.subtitle),
      trailing: IconButton(
        icon: Icon(isSaved ? Icons.bookmark : Icons.bookmark_border),
        onPressed: () {
          setState(() {
            isSaved = !isSaved;
          });
        },
      ),
    );
  }
}
