import 'package:flutter_svg/svg.dart';
import 'package:socialive/utils/assets_paths.dart';

import '../../../my_imports.dart';

class TabBarIcon extends StatelessWidget {
  const TabBarIcon({
    super.key, required this.icon, required this.text,
  });
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min, // To keep the icon and text compact
      children: [
        SvgPicture.asset(icon,height: 20,width: 20,color: isDarkTheme?Colors.white:Colors.black,),// Replace with the desired icon
        const SizedBox(width: 8),   // Optional spacing between icon and text
         Text(text),
      ],
    );
  }
}
