import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Mission',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Empowering voices through polls',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            const Text(
              'Our platform is dedicated to providing a space for users to engage in meaningful discussions and express their opinions on a variety of topics.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 24),

            const Text(
              'Our Values',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                ValueBox(
                  icon: Icons.info_outline,
                  label: 'Transparency',
                  color: Colors.blueAccent,
                ),
                ValueBox(
                  icon: Icons.group_outlined,
                  label: 'Inclusivity',
                  color: Colors.deepPurpleAccent,
                ),
                ValueBox(
                  icon: Icons.auto_awesome,
                  label: 'Innovation',
                  color: Colors.lightBlue,
                ),
                ValueBox(
                  icon: Icons.accessibility_new,
                  label: 'Accessibility Features',
                  color: Colors.indigo,
                ),
              ],
            ),

            const SizedBox(height: 32),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text('support@votingapp.com'),
            const SizedBox(height: 12),
            const Text(
              'Phone',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Text('+1 234 567 890'),
          ],
        ),
      ),
    );
  }
}

class ValueBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ValueBox({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
