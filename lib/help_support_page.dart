import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Help & Support")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: const [
            SupportCard(title: 'FAQs', icon: Icons.help_outline),
            SupportCard(title: 'Contact Us', icon: Icons.contact_mail_outlined),
            SupportCard(title: 'Report a Problem', icon: Icons.report_problem_outlined),
            SupportCard(title: 'Feedback', icon: Icons.feedback_outlined),
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const SupportCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.black87),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}