import 'package:flutter/material.dart';
import 'package:news_app/component/navigator.dart';
import 'package:news_app/component/search_view.dart';
import 'package:news_app/local/cache_helper.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/search_screen.dart';

AppBar buildMyAppBar({
  required NewsProvider newsRead,
  required NewsProvider newsWatch,
  required Size query,
  required TextEditingController searchController,
  required BuildContext context,
  bool isSearchScreen = false,
}) {
  return AppBar(
    title: Text("News App"),
    actions: [
      IconButton(
        onPressed: () {
          newsRead.changeThemeMode();
          CacheHelper.putBoolean(
              key: "isDark",
              val: newsWatch.themeMode == ThemeMode.dark ? true : false);
        },
        icon: Icon(Icons.brightness_4_outlined),
      ),
      SizedBox(width: 10),
      if (!isSearchScreen)
        IconButton(
          onPressed: () {
            newsRead.resetSearch();
            query.width < 500
                ? navigatorTo(context, SearchScreen())
                : showDialog(
                    context: context,
                    builder: (BuildContext context) => (AlertDialog(
                      content: Container(
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
                    )),
                  );
          },
          icon: Icon(Icons.search),
        ),
    ],
  );
}
