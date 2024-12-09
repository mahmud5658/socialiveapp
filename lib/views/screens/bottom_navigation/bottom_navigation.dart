import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialive/controllers/picture_controller.dart';
import '../../../controllers/bottom_navbar_controller.dart';
import 'package:socialive/utils/assets_paths.dart';
import 'package:socialive/views/add/add_screen.dart';
import 'package:socialive/views/home/home_screen.dart';
import 'package:socialive/views/search/search_screen.dart';
import 'package:socialive/views/profile/my_profile_screen.dart';

import '../../add/image_selection_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<PictureController>().getPicture();
  }
  void _showSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Select from',
            textAlign: TextAlign.center,
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context); // Close the dialog
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.camera);

                  if (image != null) {
                    Get.to(() => ImageSelectionScreen(selectedImagePath: image.path));
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera_alt_outlined, size: 40),
                    SizedBox(height: 8),
                    Text('Camera'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.pop(context); // Close the dialog
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

                  if (image != null) {
                    Get.to(() => ImageSelectionScreen(selectedImagePath: image.path));
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.photo_library_outlined, size: 40),
                    SizedBox(height: 8),
                    Text('Gallery'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final BottomNavbarController controller = Get.find<BottomNavbarController>();

    final List<Widget> pages = [
      const HomeScreen(),
      const SearchScreen(),
      const AddPostScreen(), // This won't be directly used for navigation
      const ProfileScreen(),
    ];

    return GetBuilder<BottomNavbarController>(
      builder: (_) {
        return Scaffold(
          body: PageView(
            controller: controller.pageController,physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              controller.changeIndex(index);

            },
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(

            currentIndex: controller.selectedIndex,
            onTap: (index) {
              if (index == 2) {
                _showSelectionDialog(context);
              } else {
                controller.changeIndex(index);
              }
            },
            showSelectedLabels: true,
            backgroundColor: Colors.purple,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,

            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcon.home,color: isDarkTheme?Colors.white:Colors.black,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcon.search,color: isDarkTheme?Colors.white:Colors.black,),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcon.add,color: isDarkTheme?Colors.white:Colors.black,),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsIcon.profile,color: isDarkTheme?Colors.white:Colors.black,),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
