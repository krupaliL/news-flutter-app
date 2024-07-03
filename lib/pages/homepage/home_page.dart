import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter_app/components/news_tile_loading.dart';
import 'package:news_flutter_app/components/tranding_card_loading.dart';
import 'package:news_flutter_app/controller/news_controller.dart';
import 'package:news_flutter_app/pages/homepage/widgets/news_tile.dart';
import 'package:news_flutter_app/pages/homepage/widgets/trending_card.dart';
import 'package:news_flutter_app/pages/news_details/news_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    newsController.getTrandingNews();
    newsController.getNewsForYou();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.dashboard),
                  ),
                  const Text(
                    "NEWS APP",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // newsController.getTrandingNews();
                      // print(newsController.trandingNewsList);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(Icons.person),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => newsController.isTrandingLoading.value
                      ? Row(
                          children: [
                            TrandingCardLoading(),
                            TrandingCardLoading(),
                          ],
                        )
                      : Row(
                          children: newsController.trandingNewsList
                              .map(
                                (e) => TrendingCard(
                                  ontap: () {
                                    Get.to(NewsDetailsPage(news: e));
                                  },
                                  imageUrl: e.urlToImage ?? "https://t3.ftcdn.net/jpg/05/79/68/24/360_F_579682479_j4jRfx0nl3C8vMrTYVapFnGP8EgNHgfk.jpg",
                                  title: e.title ?? "This news has no title",
                                  author: e.author ?? "Unknown",
                                  // tag: "Trending no 1",
                                  time: e.publishedAt!,
                                ),
                              )
                              .toList(),
                        ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                () => newsController.isNewsForYouLoading.value
                    ? Column(
                        children: [
                          NewsTileLoading(),
                          NewsTileLoading(),
                          NewsTileLoading(),
                        ],
                      )
                    : Column(
                        children: newsController.newsForYouList
                            .map(
                              (e) => NewsTile(
                                ontap: () {
                                  Get.to(NewsDetailsPage(news: e));
                                },
                                imageUrl: e.urlToImage ??
                                    "https://t3.ftcdn.net/jpg/05/79/68/24/360_F_579682479_j4jRfx0nl3C8vMrTYVapFnGP8EgNHgfk.jpg",
                                title: e.title ?? "This news has no title",
                                author: e.author ?? "Unknown",
                                time: e.publishedAt!,
                              ),
                            )
                            .toList(),
                      ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News about Tesla",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () => newsController.isTeslaLoading.value
                    ? Column(
                      children: [
                        NewsTileLoading(),
                        NewsTileLoading(),
                        NewsTileLoading(),
                      ],
                    )
                    : Column(
                      children: newsController.tesla5News
                          .map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(NewsDetailsPage(news: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://t3.ftcdn.net/jpg/05/79/68/24/360_F_579682479_j4jRfx0nl3C8vMrTYVapFnGP8EgNHgfk.jpg",
                              title: e.title ?? "This news has no title",
                              author: e.author ?? "Unknown",
                              time: e.publishedAt!,
                            ),
                      )
                      .toList(),
                    ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Apple News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                      () => newsController.isAppleLoading.value
                      ? Row(
                        children: [
                          TrandingCardLoading(),
                          TrandingCardLoading(),
                        ],
                      )
                      : Row(
                    children: newsController.apple5News
                        .map(
                          (e) => TrendingCard(
                        ontap: () {
                          Get.to(NewsDetailsPage(news: e));
                        },
                        imageUrl: e.urlToImage ??
                            "https://t3.ftcdn.net/jpg/05/79/68/24/360_F_579682479_j4jRfx0nl3C8vMrTYVapFnGP8EgNHgfk.jpg",
                        title: e.title ?? "This news has no title",
                        author: e.author ?? "Unknown",
                        // tag: "Trending no 1",
                        time: e.publishedAt!,
                      ),
                    )
                        .toList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Business News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Obx(
                    () => newsController.isBusinessLoading.value
                    ? Column(
                      children: [
                        NewsTileLoading(),
                        NewsTileLoading(),
                        NewsTileLoading(),
                      ],
                    )
                    : Column(
                  children: newsController.business5News
                      .map(
                        (e) => NewsTile(
                      ontap: () {
                        Get.to(NewsDetailsPage(news: e));
                      },
                      imageUrl: e.urlToImage ??
                          "https://t3.ftcdn.net/jpg/05/79/68/24/360_F_579682479_j4jRfx0nl3C8vMrTYVapFnGP8EgNHgfk.jpg",
                      title: e.title ?? "This news has no title",
                      author: e.author ?? "Unknown",
                      time: e.publishedAt!,
                    ),
                  )
                      .toList(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
