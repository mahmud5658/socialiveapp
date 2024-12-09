
import '../../../my_imports.dart';

class UserStats extends StatelessWidget {
  const UserStats({
    super.key, required this.counter, required this.title, required this.onTap,
  });
  final String counter;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(counter,style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),),
          Text(title,style: textTheme.bodySmall?.copyWith(fontSize: 14,color: isDarkTheme?Colors.white:Colors.black),)
        ],
      ),
    );
  }
}
