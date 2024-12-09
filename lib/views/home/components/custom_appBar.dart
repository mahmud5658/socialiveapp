import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socialive/routes/app_routes.dart';
import '../../../my_imports.dart';
import '../../../utils/assets_paths.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      floating: true,
      snap: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildUserAvatar(),
          SvgPicture.asset(AssetsIcon.appLogo),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    return const CircleAvatar(
      backgroundImage: NetworkImage(
        "https://avatars.githubusercontent.com/u/104672914?s=400&u=453aec5b1ec6e9a1c3c975436ee5ee55b1233ed9&v=4",
      ),
      radius: 20,
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          AssetsIcon.notification,
              () => Get.toNamed(AppRoutes.notificationScreen),
        ),
        const SizedBox(width: 16),
        _buildIconButton(
          AssetsIcon.massage,
              () => Get.toNamed(AppRoutes.messengerScreen),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 35,
          width: 35,
          child: _buildIconButton(
            AssetsIcon.logOut,
                () async {
              bool? confirmLogout = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to log out?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );

              if (confirmLogout == true) {
                await _logoutUser(context);
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton(String iconPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }

  Future<void> _logoutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(AppRoutes.welcome);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to log out: $e")),
      );
    }
  }
}
