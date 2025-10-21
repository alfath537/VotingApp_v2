import 'package:flutter/material.dart';

class ConnectedAccountsPage extends StatefulWidget {
  const ConnectedAccountsPage({super.key});

  @override
  State<ConnectedAccountsPage> createState() => _ConnectedAccountsPageState();
}

class _ConnectedAccountsPageState extends State<ConnectedAccountsPage> {
  // Simulasi status koneksi akun
  bool googleConnected = true;
  bool facebookConnected = false;
  bool twitterConnected = false;
  bool githubConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connected Accounts'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Manage your connected social accounts for quick login and integration.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),

          // Google
          _buildAccountTile(
            icon: Icons.g_mobiledata,
            iconColor: Colors.red,
            platform: 'Google',
            connected: googleConnected,
            onTap: () {
              setState(() {
                googleConnected = !googleConnected;
              });
            },
          ),

          // Facebook
          _buildAccountTile(
            icon: Icons.facebook,
            iconColor: Colors.blue,
            platform: 'Facebook',
            connected: facebookConnected,
            onTap: () {
              setState(() {
                facebookConnected = !facebookConnected;
              });
            },
          ),

          // Twitter
          _buildAccountTile(
            icon: Icons.alternate_email,
            iconColor: Colors.lightBlue,
            platform: 'Twitter',
            connected: twitterConnected,
            onTap: () {
              setState(() {
                twitterConnected = !twitterConnected;
              });
            },
          ),

          // GitHub
          _buildAccountTile(
            icon: Icons.code,
            iconColor: Colors.black,
            platform: 'GitHub',
            connected: githubConnected,
            onTap: () {
              setState(() {
                githubConnected = !githubConnected;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountTile({
    required IconData icon,
    required Color iconColor,
    required String platform,
    required bool connected,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.1),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(platform,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(connected ? 'Connected' : 'Not Connected'),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: connected ? Colors.red : Colors.green,
            foregroundColor: Colors.white,
          ),
          onPressed: onTap,
          child: Text(connected ? 'Disconnect' : 'Connect'),
        ),
      ),
    );
  }
}
