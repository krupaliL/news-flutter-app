import 'package:get/get.dart';
import 'package:news_flutter_app/pages/articalpage/artical_page.dart';
import 'package:news_flutter_app/pages/homepage/home_page.dart';
import 'package:news_flutter_app/pages/profile/profile_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    HomePage(),
    ArticalPage(),
    ProfilePage(),
  ];
}