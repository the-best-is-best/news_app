import 'package:flutter/material.dart';
import 'package:news_app/component/my_app_bar.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final url;

  const WebViewScreen(this.url);
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
          searchController: searchController),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
