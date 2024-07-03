import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter_app/config/theme.dart';
import 'package:news_flutter_app/controller/bottom_navigation_controller.dart';
import 'package:news_flutter_app/controller/home_page_controller.dart';
import 'package:news_flutter_app/pages/demopage.dart';
import 'package:news_flutter_app/pages/homepage/home_page.dart';

import 'controller/news_controller.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // NewsController newsController = Get.put(NewsController());
    // newsController.getTrandingNews();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePageController(),
      // home: DemoPage(),
    );
  }
}
