import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socialive/views/profile/components/profile_list_view.dart';
import 'package:socialive/views/profile/components/user_stats.dart';
import 'package:socialive/views/profile/components/widget_separator.dart';
import '../../utils/app_colors.dart';
import '../../utils/assets_paths.dart';
import 'components/custom_button.dart';
import 'components/profile_grid_view.dart';
import 'components/tab_bar_icon.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({super.key});

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {

  @override
  Widget build(BuildContext context) {
    late TextTheme textTheme = Theme.of(context).textTheme;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
              child: const Icon(Icons.arrow_back_ios)),
          title:  const Text(
            "Nafiur Rahman",
          ),
        ),
        body: Column(
          children: [
            _profileInfo(),
            TabBar(
              indicatorColor: isDarkTheme?Colors.white:Colors.black,
              indicatorWeight: 1.0,
              unselectedLabelStyle: textTheme.labelLarge?.copyWith(color: isDarkTheme?Colors.white70:Colors.black54),
              labelStyle: textTheme.labelLarge,
              tabs: const [
                Tab(
                    icon: TabBarIcon(icon: AssetsIcon.girdView, text: 'Grid View')
                ),
                Tab(
                    icon: TabBarIcon(icon: AssetsIcon.listView, text: 'List View')
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  ProfileGridView(),
                  ProfileListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileInfo() {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    late  final TextTheme textTheme = Theme.of(context).textTheme;
    return   Container(
      color: isDarkTheme?AppColors.appBarBackgroundColorDark:Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const InstaImageViewer(
              child:  CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/93787418?v=4'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserStats(counter: "100", title: 'Post', onTap: (){}),
                      const WidgetSeparator(),
                      UserStats(counter: "200", title: 'Following', onTap: (){}),
                      const WidgetSeparator(),
                      UserStats(counter: "300", title: 'Follower', onTap: (){}),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "@nafiur5871",style: textTheme.titleMedium?.copyWith(color: isDarkTheme?Colors.white70:Colors.black87),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CustomButton(text: 'Follow', onTap: (){}),
                      const SizedBox(width: 25,),
                      CustomButton(text: 'Message', onTap: (){}),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


