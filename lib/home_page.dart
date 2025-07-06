import 'package:flutter/material.dart';
import 'search_page.dart';
import 'saved_page.dart';
import 'profile_page.dart';
import 'movie_vote_page.dart';

// Import halaman kategori
import 'politics_page.dart';
import 'entertainment_page.dart';
import 'tvshows_page.dart';
import 'technology_page.dart';
import 'health_page.dart';
import 'education_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final pages = const [HomeContent(), SearchPage(), SavedPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (i) => setState(() => selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vote Now",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PTSerif',
                ),
              ),
              const SizedBox(height: 16),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Search polls",
                          style: TextStyle(
                            fontFamily: 'PTSerif',
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Add location and guests",
                          style: TextStyle(
                            fontFamily: 'PTSerif',
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CategoryIcon(label: 'Politics', icon: Icons.account_balance, page: PoliticsPage()),
                    SizedBox(width: 16),
                    CategoryIcon(label: 'Entertainment', icon: Icons.movie, page: EntertainmentPage()),
                    SizedBox(width: 16),
                    CategoryIcon(label: 'TV Shows', icon: Icons.tv, page: TopTVShowsPage()),
                    SizedBox(width: 16),
                    CategoryIcon(label: 'Technology', icon: Icons.devices, page: TechnologyPage()),
                    SizedBox(width: 16),
                    CategoryIcon(label: 'Health', icon: Icons.health_and_safety, page: HealthPage()),
                    SizedBox(width: 16),
                    CategoryIcon(label: 'Education', icon: Icons.school, page: EducationPage()),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Trending Polls
              const Text(
                "Trending Polls",
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
                  children: [
                    PollCard(
                      image: 'assets/images/images.jpg',
                      title: "Best Movie 2023",
                      subtitle: "Vote for your favorite",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MovieVotePage()),
                        );
                      },
                    ),
                    PollCard(
                      image: 'assets/images/images1.jpg',
                      title: "Tech Innovations",
                      subtitle: "Choose the best",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Notification Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Receive notifications",
                    style: TextStyle(fontFamily: 'PTSerif'),
                  ),
                  Switch(
                    value: notificationsEnabled,
                    onChanged: (val) {
                      setState(() {
                        notificationsEnabled = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // User Info
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/imagespp.png'),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Nichi Putra Lin",
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Participated in 5 polls",
                        style: TextStyle(fontFamily: 'PTSerif'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final Widget page;

  const CategoryIcon({
    required this.label,
    required this.icon,
    required this.page,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Column(
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontFamily: 'PTSerif')),
        ],
      ),
    );
  }
}

class PollCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const PollCard({
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  State<PollCard> createState() => _PollCardState();
}

class _PollCardState extends State<PollCard> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            width: 250,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: AssetImage(widget.image), fit: BoxFit.cover),
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      fontFamily: 'PTSerif',
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Icon Save di kanan atas
          Positioned(
            top: 10,
            right: 20,
            child: IconButton(
              icon: Icon(
                isSaved ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  isSaved = !isSaved;
                });
                debugPrint('${widget.title} saved: $isSaved');
              },
            ),
          ),
        ],
      ),
    );
  }
}
