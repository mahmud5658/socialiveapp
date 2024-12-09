import '../../../../my_imports.dart';
import '../../../../utils/app_colors.dart';

class NotificationTile extends StatelessWidget {
  final String name;
  final String action;
  final String detail;
  final String time;
  final String avatar;
  final bool showFollowButton;

  const NotificationTile({
    super.key,
    required this.name,
    required this.action,
    required this.detail,
    required this.time,
    required this.avatar,
    this.showFollowButton = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(avatar),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style:  TextStyle(fontSize: 16, color: isDarkTheme?AppColors.textColorDark:AppColors.textColorLight ),
                    children: [
                      TextSpan(
                        text: "$name ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "$action ",
                      ),
                      TextSpan(
                        text: detail,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
          if (showFollowButton)
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Follow",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}