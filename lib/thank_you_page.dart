import 'package:flutter/material.dart';
import 'package:voting_app/feedback_page.dart';
import 'package:voting_app/share_movie_page.dart';
import 'package:voting_app/view_results_page.dart';
import 'home_page.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.home, size: 20),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Thank You!',
            style: TextStyle(
              fontFamily: 'PTSerif',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Image.asset(
              'assets/images/mean_girls.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Vote Again"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ViewResultsPage()),
                  );
                },
                child: const Text("View Results"),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ShareMoviePage()),
                    );
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.share, size: 30),
                      SizedBox(height: 4),
                      Text("Share"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement Invite Friends
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.person_add, size: 30),
                      SizedBox(height: 4),
                      Text("Invite Friends"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FeedbackPage()),
                    );
                  },
                  child: Column(
                    children: const [
                      Icon(Icons.feedback, size: 30),
                      SizedBox(height: 4),
                      Text("Feedback"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
