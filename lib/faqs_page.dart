import 'package:flutter/material.dart';

class FAQsPage extends StatelessWidget {
  const FAQsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQs"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ListTile(
            title: Text("What is this app?"),
            subtitle: Text("Learn about the platform."),
          ),
          ListTile(
            title: Text("How to participate?"),
            subtitle: Text("Easy tips to join polls."),
          ),
          ListTile(
            title: Text("Privacy concerns"),
            subtitle: Text("How we protect your data."),
          ),
          ListTile(
            title: Text("Technical issues"),
            subtitle: Text("Troubleshooting tips."),
          ),
        ],
      ),
    );
  }
}
