import '../../../my_imports.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 80,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 6),
              backgroundColor:  isDarkTheme?Colors.blueGrey:Colors.grey,
              foregroundColor: isDarkTheme? AppColors.textColorDark:AppColors.textColorLight,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)
              )
          ),
          onPressed: onTap, child:  Text(text)),
    );
  }
}