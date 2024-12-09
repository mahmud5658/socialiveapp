import 'package:flutter/material.dart';

class AddMusicScreen extends StatelessWidget {
  const AddMusicScreen({super.key});

  final List<Map<String, String>> songs = const [
    {'title': 'Rema, Selena Gomez - Calm Down', 'subtitle': '20 second'},
    {'title': 'Imagine Dragons - Believer', 'subtitle': '30 second'},
    {'title': 'Adele - Hello', 'subtitle': '25 second'},
    {'title': 'Ed Sheeran - Shape of You', 'subtitle': '40 second'},
    {'title': 'Billie Eilish - Bad Guy', 'subtitle': '35 second'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Music',
        ),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Input Text',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          // List of Songs
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return ListTile(
                  onTap: () => Navigator.pop(context, song),
                  title: Text(
                    song['title']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    song['subtitle']!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  trailing:
                      const Icon(Icons.play_circle_outline, color: Colors.grey),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
