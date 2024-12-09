import 'package:socialive/utils/assets_paths.dart';
import 'package:socialive/views/profile/components/profile_grid_view.dart';

import '../../controllers/bottom_navbar_controller.dart';
import '../../my_imports.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: TextFormField(
          cursorColor: isDarkTheme?Colors.white:Colors.black,
          decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  AssetsIcon.search,
                  width: 25,
                  height: 25,
                  color: isDarkTheme
                      ? AppColors.textColorDark
                      : AppColors.textColorLight,
                ),
              )),
        ),
      ),
      body: PopScope(
          canPop: false,
          onPopInvoked: (value) {
            backToHome();
          },
          child: const ProfileGridView()),
    );
  }

  void backToHome() {
    Get.find<BottomNavbarController>().backToHome();
  }
}
