import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_assets.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.aboutWallpaper),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 22,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, size: 35),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Todo App", style: TextStyle(fontSize: 30)),
              Text("Version 1.1", style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Image.asset(AppAssets.logo, width: 100, height: 100),
              SizedBox(height: 10),
              Text("Made By | 3BS", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
