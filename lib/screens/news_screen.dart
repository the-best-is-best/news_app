import 'package:flutter/material.dart';
import 'package:news_app/component/my_app_bar.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var newsWatch = context.watch<NewsProvider>();
    var newsRead = context.read<NewsProvider>();
    var query = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildMyAppBar(
          context: context,
          newsRead: newsRead,
          newsWatch: newsWatch,
          query: query,
          searchController: searchController),
      body: newsWatch.screens[newsWatch.currentIndexNavBottomBar],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: newsWatch.currentIndexNavBottomBar,
        onTap: (i) => newsRead.changeBottomNavBar(i),
        items: newsWatch.bottomItems,
      ),
    );
  }
}
