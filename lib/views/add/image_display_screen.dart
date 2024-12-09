import 'package:flutter/material.dart';
import 'package:socialive/my_imports.dart';
import 'dart:io';

import 'components/add_location_screen.dart';
import 'components/add_music_screen.dart';

class ImageDisplayScreen extends StatefulWidget {
  final List<String> selectedImages;

  const ImageDisplayScreen({super.key, required this.selectedImages});

  @override
  State<ImageDisplayScreen> createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  Map<String, String>? selectedLocation;
  Map<String, String>? selectedMusic;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'New Post',
        ),
        actions: [
          TextButton(
            onPressed: _showPostDialog,
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and Caption Section
            _buildImageWithTextField(
              image: File(widget.selectedImages[0]),
              hintText: 'Write a caption',
            ),
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 12),

            // Add Location Section
            Text(
              "Add Location",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            _buildMultipleSelectButtons(
              isLocation: true,
              onTap: () async {
                final result = await Navigator.push<Map<String, String>>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddLocationScreen()),
                );
                if (result != null) {
                  setState(() => selectedLocation = result);
                }
              },
            ),

            if (selectedLocation != null)
              _buildSelectedItem(
                icon: Icons.location_on,
                title: selectedLocation!['title']!,
                subtitle: selectedLocation!['subtitle']!,
                onRemove: () => setState(() => selectedLocation = null),
              ),

            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 16),

            // Add Music Section
            Text(
              "Add Music",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            _buildMultipleSelectButtons(
              isLocation: false,
              onTap: () async {
                final result = await Navigator.push<Map<String, String>>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddMusicScreen()),
                );
                if (result != null) {
                  setState(() => selectedMusic = result);
                }
              },
            ),

            if (selectedMusic != null)
              _buildSelectedItem(
                icon: Icons.music_note,
                title: selectedMusic!['title']!,
                subtitle: selectedMusic!['subtitle']!,
                onRemove: () => setState(() => selectedMusic = null),
              ),
          ],
        ),
      ),
    );
  }

  // Widget for the image and text field (Write a caption)
  Widget _buildImageWithTextField(
      {required File image, required String hintText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.file(
            image,
            height: 80,
            width: 80,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 16),
              filled: true,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }

  // Widget for multiple select buttons with horizontal scroll
  Widget _buildMultipleSelectButtons({
    required bool isLocation,
    required VoidCallback onTap,
  }) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          1,
          (_) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                foregroundColor: isDarkTheme?AppColors.textColorDark:AppColors.textColorLight,
                side: const BorderSide(color: Colors.grey),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: isLocation
                  ? const  Row(
                children: [
                  Icon(Icons.location_on, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Select location',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
                  : const Row(
                      children: [
                        Icon(Icons.music_note, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Select Music',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget for displaying selected location or music
  Widget _buildSelectedItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onRemove,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _showPostDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info,
                size: 48,
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              const Text(
                'Do you want to post?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your post will share by clicking yes, '
                'if need any change click on edit.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Post Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
