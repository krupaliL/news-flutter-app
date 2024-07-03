import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter_app/controller/news_controller.dart';
import 'package:news_flutter_app/pages/articalpage/widgets/search_widget.dart';
import 'package:news_flutter_app/pages/news_details/news_details.dart';

import '../homepage/widgets/news_tile.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: newsController.newsForYouList
                      .map(
                        (e) => NewsTile(
                          ontap: () {
                            Get.to(NewsDetailsPage(news: e));
                          },
                          imageUrl: e.urlToImage ??
                              "https://t3.ftcdn.net/jpg/05/79/68/24/360_F_579682479_j4jRfx0nl3C8vMrTYVapFnGP8EgNHgfk.jpg",
                          title: e.title!,
                          author: e.author ?? "Unknown",
                          time: e.publishedAt!,
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
