import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool pollReminders = true;
  bool newFeatures = false;
  bool voteResults = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationTile(
            icon: Icons.notifications_active,
            title: 'Poll Reminders',
            subtitle: 'Get notified before polls close',
            value: pollReminders,
            onChanged: (val) => setState(() => pollReminders = val),
          ),
          const SizedBox(height: 12),
          _buildNotificationTile(
            icon: Icons.update,
            title: 'New Features',
            subtitle: 'Stay up to date with app updates',
            value: newFeatures,
            onChanged: (val) => setState(() => newFeatures = val),
          ),
          const SizedBox(height: 12),
          _buildNotificationTile(
            icon: Icons.how_to_vote,
            title: 'Vote Results',
            subtitle: 'Receive final poll results',
            value: voteResults,
            onChanged: (val) => setState(() => voteResults = val),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Switch(value: value, onChanged: onChanged),
      ),
    );
  }
}
