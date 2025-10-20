import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  State<PrivacySettingsPage> createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool location = false;
  bool camera = false;
  bool microphone = false;
  bool contact = false;

  Future<void> _confirmToggle(String title, bool currentValue, Function(bool) onConfirmed) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Confirm',
          style: const TextStyle(fontFamily: 'PTSerif'),
        ),
        content: Text(
          'Are you sure you want to ${currentValue ? 'disable' : 'enable'} $title access?',
          style: const TextStyle(fontFamily: 'PTSerif'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'Cancel',
              style: TextStyle(fontFamily: 'PTSerif'),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Yes',
              style: TextStyle(fontFamily: 'PTSerif'),
            ),
          ),
        ],
      ),
    );

    if (result == true) {
      onConfirmed(!currentValue);
    }
  }

  void _saveChanges() {
    
    debugPrint('Saved settings: Location:$location, Camera:$camera, Mic:$microphone, Contact:$contact');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Changes saved'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Settings",
          style: TextStyle(fontFamily: 'PTSerif', fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text("Location Access", style: TextStyle(fontFamily: 'PTSerif')),
              value: location,
              onChanged: (val) => _confirmToggle("Location", location, (newValue) {
                setState(() => location = newValue);
              }),
            ),
            SwitchListTile(
              title: const Text("Camera Access", style: TextStyle(fontFamily: 'PTSerif')),
              value: camera,
              onChanged: (val) => _confirmToggle("Camera", camera, (newValue) {
                setState(() => camera = newValue);
              }),
            ),
            SwitchListTile(
              title: const Text("Microphone Access", style: TextStyle(fontFamily: 'PTSerif')),
              value: microphone,
              onChanged: (val) => _confirmToggle("Microphone", microphone, (newValue) {
                setState(() => microphone = newValue);
              }),
            ),
            SwitchListTile(
              title: const Text("Contact Access", style: TextStyle(fontFamily: 'PTSerif')),
              value: contact,
              onChanged: (val) => _confirmToggle("Contact", contact, (newValue) {
                setState(() => contact = newValue);
              }),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: _saveChanges,
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(fontFamily: 'PTSerif'),
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    side: const BorderSide(color: Colors.blueAccent),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontFamily: 'PTSerif', color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
