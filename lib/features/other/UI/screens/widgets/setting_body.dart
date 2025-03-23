import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/local/theme_provider.dart';
import '../../../../../core/utils/app_colors.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.dark_mode, size: 25),
                  SizedBox(width: 5),
                  Text("Dark Mode", style: TextStyle(fontSize: 16)),
                ],
              ),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                  activeColor: AppColors.primaryColor,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () => Navigator.pushNamed(context, "about_screen"),
            child: Row(
              children: [
                Icon(Icons.app_blocking_outlined, size: 25),
                SizedBox(width: 5),
                Text("About App", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
