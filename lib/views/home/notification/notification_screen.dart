import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socialive/utils/assets_paths.dart';
import '../../../my_imports.dart';
import 'components/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    final notifications = [
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
      {
        "name": "Dennis Nedry",
        "action": "commented on",
        "detail": "Isla Nublar SOC2 compliance report",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": false,
      },
      {
        "name": "Md Shagor",
        "action": "from your contacts is on Instagram as",
        "detail": "shagor2240",
        "time": "Last Wednesday at 9:42 AM",
        "avatar": 'assets/images/person.png',
        "showFollowButton": true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(AssetsIcon.arrowBack,color: isDarkTheme?Colors.white:Colors.black,),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Notification",
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationTile(
            name: notification["name"] as String,
            action: notification["action"] as String,
            detail: notification["detail"] as String,
            time: notification["time"] as String,
            avatar: notification["avatar"] as String,
            showFollowButton:
                notification["showFollowButton"] as bool? ?? false,
          );
        },
      ),
    );
  }
}
