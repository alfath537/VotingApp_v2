import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key});

  void _shareToFriend(BuildContext context, String friendName) {
    const String appLink = "https://example.com";
    Share.share('Hai $friendName, yuk vote bareng di Voting App! Download di $appLink');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Undangan telah terkirim ke $friendName'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _shareViaLink(BuildContext context) {
    const String appLink = "https://example.com";
    Clipboard.setData(const ClipboardData(text: appLink));

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Link Copied'),
        content: const Text('Link Voting App sudah dicopy ke clipboard.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Color _getRandomColor() {
    List<Color> colors = [
      Colors.blueAccent,
      Colors.purpleAccent,
      Colors.teal,
      Colors.orangeAccent,
      Colors.green,
      Colors.redAccent,
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> friends = [
      {"name": "Asyifa Alfath Kasman", "email": "asyifa@example.com"},
      {"name": "Ahmad Danu Risky Lubis", "email": "danu@example.com"},
      {"name": "Sherly Angelina Zalukhu", "email": "sherly@example.com"},
      {"name": "Derry", "email": "derry@example.com"},
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Center(
              child: Text(
                "Invite Friends",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          // List friends
          Expanded(
            child: friends.isEmpty
                ? const Center(
                    child: Text(
                      "No friends to invite yet.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: friends.length,
                    itemBuilder: (context, index) {
                      var friend = friends[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getRandomColor(),
                            child: Text(
                              friend["name"]![0],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(
                            friend["name"] ?? "",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(friend["email"] ?? ""),
                          trailing: IconButton(
                            icon: const Icon(Icons.share, color: Colors.blue),
                            onPressed: () => _shareToFriend(context, friend["name"] ?? ""),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          // Tombol Cancel di bawah
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _shareViaLink(context),
        label: const Text(
          'Invite via Link',
          style: TextStyle(color: Colors.white), 
        ),
        icon: const Icon(Icons.link, color: Colors.white), 
        backgroundColor: Colors.purple,
      ),
    );
  }
}
