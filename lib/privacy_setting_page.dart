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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Settings"),
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
              title: const Text("Location Access"),
              value: location,
              onChanged: (val) => setState(() => location = val),
            ),
            SwitchListTile(
              title: const Text("Camera Access"),
              value: camera,
              onChanged: (val) => setState(() => camera = val),
            ),
            SwitchListTile(
              title: const Text("Microphone Access"),
              value: microphone,
              onChanged: (val) => setState(() => microphone = val),
            ),
            SwitchListTile(
              title: const Text("Contact Access"),
              value: contact,
              onChanged: (val) => setState(() => contact = val),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // save action
                  },
                  child: const Text("Save Changes"),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
