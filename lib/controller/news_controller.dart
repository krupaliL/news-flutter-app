import 'dart:convert';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_flutter_app/model/news_model.dart';

class NewsController extends GetxController {

  RxList<NewsModel> trandingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> trandingNewsList5 = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> apple5News = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> tesla5News = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> business5News = <NewsModel>[].obs;
  RxBool isTrandingLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleLoading = false.obs;
  RxBool isTeslaLoading = false.obs;
  RxBool isBusinessLoading = false.obs;
  RxBool isSpeaking = false.obs;
  FlutterTts flutterTts = FlutterTts();

  void onInit() async {
    super.onInit();
    getTrandingNews();
    getNewsForYou();
    getAppleNews();
    getTeslaNews();
    getBusinessNews();
  }

  Future<void> getTrandingNews() async {
    isTrandingLoading.value = true;
    var baseURL = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f447da233e894c429038742f37e255b9";
    try {
      var response = await http.get(Uri.parse(baseURL));
      // print(response);
      if (response.statusCode == 200) {
        // print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          trandingNewsList.add(NewsModel.fromJson(news));
          // print(news);
        }
        trandingNewsList5 = trandingNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in Tranding News.");
      }
    } catch (ex) {
      print(ex);
    }
    isTrandingLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=f447da233e894c429038742f37e255b9";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newsForYou5.value = newsForYouList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in News for you.");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getAppleNews() async {
    isAppleLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=apple&from=2024-06-25&to=2024-06-25&sortBy=popularity&apiKey=f447da233e894c429038742f37e255b9";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        apple5News.value = appleNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in News for you.");
      }
    } catch (ex) {
      print(ex);
    }
    isAppleLoading.value = false;
  }

  Future<void> getTeslaNews() async {
    isTeslaLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=tesla&from=2024-05-26&sortBy=publishedAt&apiKey=f447da233e894c429038742f37e255b9";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          teslaNewsList.add(NewsModel.fromJson(news));
        }
        tesla5News.value = teslaNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in News for you.");
      }
    } catch (ex) {
      print(ex);
    }
    isTeslaLoading.value = false;
  }

  Future<void> getBusinessNews() async {
    isBusinessLoading.value = true;
    var baseURL = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f447da233e894c429038742f37e255b9";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        // print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          businessNewsList.add(NewsModel.fromJson(news));
        }
        business5News.value = businessNewsList.sublist(0, 5).obs;
      } else {
        print("Something went wrong in News for you.");
      }
    } catch (ex) {
      print(ex);
    }
    isBusinessLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForYouLoading.value = true;
    var baseURL = "https://newsapi.org/v2/everything?q=$search&apiKey=f447da233e894c429038742f37e255b9";
    try {
      var response = await http.get(Uri.parse(baseURL));
      if (response.statusCode == 200) {
        // print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          newsForYouList.add(NewsModel.fromJson(news));
          if(i == 10) {
            break;
          }
        }
      } else {
        print("Something went wrong in News for you.");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForYouLoading.value = false;
  }
  
  Future<void> speak(String text) async {
    isSpeaking.value = true;
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
    // isSpeaking.value = false;
  }

  void stop() async {
    await flutterTts.stop();
    isSpeaking.value = false;
  }
}