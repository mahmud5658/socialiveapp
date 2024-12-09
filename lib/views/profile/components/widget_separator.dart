import '../../../my_imports.dart';

class WidgetSeparator extends StatelessWidget {
  const WidgetSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
   return Row(
     children: [
       Container(
         margin: const EdgeInsets.symmetric(horizontal: 5),
         height: 5,
         width: 5,
         decoration:  BoxDecoration(
           // color: Color(0xFFD0D5DD),
           color: isDarkTheme?Colors.white70:Colors.black38,
           shape: BoxShape.circle
         ),
       ),
     ],
   );
  }
}
