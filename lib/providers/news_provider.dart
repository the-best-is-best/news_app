import 'package:flutter/material.dart';
import 'package:news_app/modals/news_modal.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/busness_screen.dart';
import 'package:news_app/screens/sciense_screen.dart';
import 'package:news_app/screens/sports_screen.dart';

class NewsProvider extends ChangeNotifier {
  int currentIndexNavBottomBar = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  List<Widget> screens = [
    BusbnessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndexNavBottomBar = index;
    notifyListeners();
  }

  List<NewsModal> business = [];

  Future getDataBusiness() async {
    if (business.length == 0) {
      int lastId = 0;
      await DioHelper.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'ad7bc4a227bf40b0afcd9c698a61162c'
      }).then((values) {
        for (var value in values.data['articles']) {
          lastId++;
          business.add(NewsModal(
            id: lastId,
            auther: value['auther'] != null ? value['auther'] : '',
            title: value['title'] != null ? value['title'] : '',
            description:
                value['description'] != null ? value['description'] : '',
            urlImage: value['urlToImage'] != null ? value['urlToImage'] : '',
            publishedAt: value['publishedAt'] != null
                ? DateTime.parse(value['publishedAt'])
                : DateTime.parse('1/1/1900'),
            content: value['content'] != null ? value['content'] : '',
            url: value['url'] != null ? value['url'] : '',
          ));
        }
      }).catchError((onError) {
        print("some error" + onError);
      });

      notifyListeners();
    }
  }

  List<NewsModal> sports = [];
  Future getDataSports() async {
    if (sports.length == 0) {
      int lastId = 0;
      await DioHelper.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'ad7bc4a227bf40b0afcd9c698a61162c'
      }).then((values) {
        for (var value in values.data['articles']) {
          lastId++;
          sports.add(NewsModal(
            id: lastId,
            auther: value['auther'] != null ? value['auther'] : '',
            title: value['title'] != null ? value['title'] : '',
            description:
                value['description'] != null ? value['description'] : '',
            urlImage: value['urlToImage'] != null ? value['urlToImage'] : '',
            publishedAt: value['publishedAt'] != null
                ? DateTime.parse(value['publishedAt'])
                : DateTime.parse('1/1/1900'),
            content: value['content'] != null ? value['content'] : '',
            url: value['url'] != null ? value['url'] : '',
          ));
        }
      }).catchError((onError) {
        print(onError);
      });

      notifyListeners();
    }
  }

  List<NewsModal> science = [];
  Future getDataScience() async {
    if (science.length == 0) {
      int lastId = 0;
      await DioHelper.getData(url: "v2/top-headlines", query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'ad7bc4a227bf40b0afcd9c698a61162c'
      }).then((values) {
        for (var value in values.data['articles']) {
          lastId++;
          science.add(NewsModal(
            id: lastId,
            auther: value['auther'] != null ? value['auther'] : '',
            title: value['title'] != null ? value['title'] : '',
            description:
                value['description'] != null ? value['description'] : '',
            urlImage: value['urlToImage'] != null ? value['urlToImage'] : '',
            publishedAt: value['publishedAt'] != null
                ? DateTime.parse(value['publishedAt'])
                : DateTime.parse('1/1/1900'),
            content: value['content'] != null ? value['content'] : '',
            url: value['url'] != null ? value['url'] : '',
          ));
        }
      }).catchError((onError) {
        print(onError);
      });
    }
  }

  List<NewsModal> search = [];
  bool loadingSearch = false;
  Future getDataSearch(String val) async {
    search = [];

    int lastId = 0;
    await DioHelper.getData(url: "v2/everything", query: {
      'q': val,
      'apiKey': 'ad7bc4a227bf40b0afcd9c698a61162c',
    }).then((values) {
      for (var value in values.data['articles']) {
        lastId++;
        search.add(NewsModal(
          id: lastId,
          auther: value['auther'] != null ? value['auther'] : '',
          title: value['title'] != null ? value['title'] : '',
          description: value['description'] != null ? value['description'] : '',
          urlImage: value['urlToImage'] != null ? value['urlToImage'] : '',
          publishedAt: value['publishedAt'] != null
              ? DateTime.parse(value['publishedAt'])
              : DateTime.parse('1/1/1900'),
          content: value['content'] != null ? value['content'] : '',
          url: value['url'] != null ? value['url'] : '',
        ));
      }
    }).catchError((onError) {
      print(onError);
    });
    loadingSearch = false;
    notifyListeners();
  }

  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode() {
    themeMode == ThemeMode.light
        ? themeMode = ThemeMode.dark
        : themeMode = ThemeMode.light;
    notifyListeners();
  }

  getThemeMode(ThemeMode val) {
    themeMode = val;
  }

  resetSearch() {
    search = [];
    notifyListeners();
  }
}
