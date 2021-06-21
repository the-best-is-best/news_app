import 'package:flutter/material.dart';
import 'package:news_app/component/my_app_bar.dart';
import 'package:news_app/component/search_view.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newsWatch = context.watch<NewsProvider>();
    var newsRead = context.read<NewsProvider>();
    var query = MediaQuery.of(context).size;
    final searchController = TextEditingController();

    return Scaffold(
      appBar: buildMyAppBar(
        context: context,
        newsRead: newsRead,
        newsWatch: newsWatch,
        query: query,
        searchController: searchController,
        isSearchScreen: true,
      ),
      body: Center(
        child: searchView(
            context: context,
            controller: searchController,
            type: TextInputType.text,
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Search must not be empty';
              }
              return null;
            },
            label: "Search",
            prefix: Icons.search),
      ),
    );
  }
}
