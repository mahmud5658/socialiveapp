import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'image_display_screen.dart';

class ImageSelectionScreen extends StatefulWidget {
  final String? selectedImagePath;

  const ImageSelectionScreen({super.key, this.selectedImagePath});

  @override
  _ImageSelectionScreenState createState() => _ImageSelectionScreenState();
}

class _ImageSelectionScreenState extends State<ImageSelectionScreen> {
  String? _selectedImagePath;
  List<XFile>? _galleryImages;
  final List<String> _selectedImages = [];
  bool _isMultiSelectEnabled = false;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _selectedImagePath = widget.selectedImagePath;
    _checkPermissionsAndLoadImages();
  }

  Future<void> _checkPermissionsAndLoadImages() async {
    if (await Permission.photos.request().isGranted) {
      await _loadGalleryImages();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Permission to access gallery is required."),
        ),
      );
    }
  }

  Future<void> _loadGalleryImages() async {
    try {
      final images = await _picker.pickMultiImage();
      setState(() {
        _galleryImages = images;
      });
    } catch (e) {
      debugPrint("Error fetching gallery images: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to load gallery images."),
        ),
      );
    }
  }

  void _toggleImageSelection(String imagePath) {
    setState(() {
      if (_selectedImages.contains(imagePath)) {
        _selectedImages.remove(imagePath);
      } else {
        _selectedImages.add(imagePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('New Post'),
        actions: [
          TextButton(
            onPressed: () {
              if (_selectedImages.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDisplayScreen(selectedImages: _selectedImages),
                  ),
                );
              } else if (_selectedImagePath != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDisplayScreen(selectedImages: [_selectedImagePath!]),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select an image.')),
                );
              }
            },
            child: const Text(
              'Next',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
              ),
            ),
          ),
        ],

      ),
      body: Column(
        children: [
          // Top Preview Section
          Expanded(
            flex: 5,
            child: _selectedImagePath != null
                ? Image.file(
              File(_selectedImagePath!),
              fit: BoxFit.fill,
              width: double.infinity,
            )
                : const Center(child: Text('No image selected')),
          ),

          // Recent Photos Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Row(
                    children: [
                      Text(
                        'Recent photos',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isMultiSelectEnabled = !_isMultiSelectEnabled;
                          if (!_isMultiSelectEnabled) _selectedImages.clear();
                        });
                      },
                      icon: const Icon(Icons.check_box_outlined, size: 16),
                      label: const Text(
                        'Multiple Select',
                        style: TextStyle(fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: _isMultiSelectEnabled
                            ? Colors.blue
                            : Colors.grey[300],
                        foregroundColor:
                        _isMultiSelectEnabled ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Image Grid Section
          Expanded(
            flex: 3,
            child: _galleryImages != null
                ? _galleryImages!.isNotEmpty
                ? GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _galleryImages!.length,
              itemBuilder: (context, index) {
                final image = _galleryImages![index];
                final isSelected = _isMultiSelectEnabled
                    ? _selectedImages.contains(image.path)
                    : _selectedImagePath == image.path;

                return GestureDetector(
                  onTap: () {
                    if (_isMultiSelectEnabled) {
                      _toggleImageSelection(image.path);
                    } else {
                      setState(() {
                        _selectedImagePath = image.path;
                      });
                    }
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(image.path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (isSelected)
                        const Positioned(
                          top: 8,
                          right: 8,
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                );
              },
            )
                : const Center(child: Text("No images found in the gallery."))
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}




