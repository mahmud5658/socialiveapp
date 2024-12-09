import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socialive/api/network_caller/network_caller.dart';
import 'package:socialive/controllers/picture_controller.dart';
import 'package:socialive/views/profile/components/profile_list_view.dart';
import 'package:socialive/views/profile/components/user_stats.dart';
import 'package:socialive/views/profile/components/widget_separator.dart';
import 'package:socialive/views/profile/follower.dart';
import 'package:socialive/views/profile/other_profile_screen.dart';

import '../../controllers/bottom_navbar_controller.dart';
import '../../utils/app_colors.dart';
import 'components/profile_grid_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();

  User? _currentUser;
  String _name = '';
  String _email = '';
  String _profileImageUrl = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      _currentUser = _auth.currentUser;
      if (_currentUser != null) {
        final userDoc = await _firestore.collection('users').doc(_currentUser!.uid).get();
        final data = userDoc.data();

        if (data != null) {
          setState(() {
            final firstName = data['firstName'] ?? '';
            final lastName = data['lastName'] ?? '';
            _name = '$firstName $lastName'; // Combine firstName and lastName
            _email = data['email'] ?? 'No Email';
            _profileImageUrl = data['profilePicture'] ?? '';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      print('Error loading user profile: $e');
    }
  }


  Future<void> _pickAndUploadImage() async {
    try {
      final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        final file = File(pickedImage.path);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_pictures')
            .child('${_currentUser!.uid}.jpg');

        await storageRef.putFile(file);

        final downloadUrl = await storageRef.getDownloadURL();
        await _firestore.collection('users').doc(_currentUser!.uid).update({
          'profilePicture': downloadUrl,
        });

        setState(() {
          _profileImageUrl = downloadUrl;
        });
      }
    } catch (e) {
      print('Error picking or uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "My Profile",
          ),
          centerTitle: true,
        ),
        body: PopScope(
          canPop: false,
          onPopInvoked: (value) {
            backToHome();
          },
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
            children: [
              _profileInfo(),
              TabBar(
                indicatorColor: isDarkTheme ? Colors.white : Colors.black,
                indicatorWeight: 1.0,
                unselectedLabelStyle: textTheme.labelLarge?.copyWith(
                  color: isDarkTheme ? Colors.white70 : Colors.black54,
                ),
                labelStyle: textTheme.labelLarge,
                tabs: const [
                  Tab(text: "All Post"),
                  Tab(text: "Streaming"),
                  Tab(text: "Saved"),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ProfileGridView(),
                    ProfileListView(),
                    ProfileGridView(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const OtherProfileScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _profileInfo() {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: isDarkTheme ? AppColors.appBarBackgroundColorDark : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: _profileImageUrl.isNotEmpty
                      ? NetworkImage(_profileImageUrl)
                      : null,
                  child: _profileImageUrl.isEmpty
                      ? const Icon(Icons.person, size: 45)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickAndUploadImage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDarkTheme ? Colors.black : Colors.white,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _email,
                    style: textTheme.titleMedium?.copyWith(
                      color: isDarkTheme ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserStats(counter: "100", title: 'Post', onTap: () {}),
                      const WidgetSeparator(),
                      UserStats(counter: "200", title: 'Following', onTap: () {}),
                      const WidgetSeparator(),
                      UserStats(counter: "300", title: 'Follower', onTap: () {
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void backToHome() {
    Get.find<BottomNavbarController>().backToHome();
  }
}
