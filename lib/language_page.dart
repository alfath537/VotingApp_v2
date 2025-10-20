import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = 'English';

  void _saveLanguage() {
    debugPrint('Saved language: $selectedLanguage');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Language changed to $selectedLanguage'),
        duration: const Duration(seconds: 2),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final languages = ['English', 'Bahasa Indonesia', 'Japanese', 'Korean'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Language',
          style: TextStyle(fontFamily: 'PTSerif', fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Select your preferred language',
            style: TextStyle(fontSize: 16, fontFamily: 'PTSerif'),
          ),
          const SizedBox(height: 16),
          ...languages.map(
            (lang) => RadioListTile<String>(
              title: Text(lang, style: const TextStyle(fontFamily: 'PTSerif')),
              value: lang,
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: _saveLanguage,
            child: const Text(
              'Save Changes',
              style: TextStyle(fontFamily: 'PTSerif'),
            ),
          ),
        ],
      ),
    );
  }
}
