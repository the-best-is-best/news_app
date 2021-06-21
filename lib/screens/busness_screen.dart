import 'package:flutter/material.dart';
import 'package:news_app/component/grid_view.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class BusbnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newsWatch = context.watch<NewsProvider>();
    var newsRead = context.read<NewsProvider>();
    return FutureBuilder(
      future: newsRead.getDataBusiness(),
      builder: (context, AsyncSnapshot snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : newsGridView(context, newsWatch.business),
    );
  }
}
