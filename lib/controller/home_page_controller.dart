import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/navigationbar.dart';
import 'bottom_navigation_controller.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController controller = Get.put(BottomNavController());
    return Scaffold(
      floatingActionButton: BottomNav(),
      body: Obx(
            () => controller.pages[controller.index.value],
      ),
    );
  }
}