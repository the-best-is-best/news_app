import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

import 'form_field.dart';
import 'grid_view_search.dart';

Widget searchView(
    {required BuildContext context,
    required TextEditingController controller,
    required TextInputType type,
    required validate,
    required String label,
    required IconData prefix}) {
  var newsRead = context.read<NewsProvider>();

  var newsWatch = context.watch<NewsProvider>();
  var query = MediaQuery.of(context).size;

  return Container(
    width: query.width > 1200 ? query.width / 2 : query.width - 10,
    color: newsWatch.themeMode == ThemeMode.light
        ? Colors.white
        : HexColor('333739'),
    child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Search",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 15,
            ),
            defaultFormField(
              context: context,
              controller: controller,
              type: type,
              validate: validate,
              onChange: (value) {
                newsRead.getDataSearch(value);
              },
              label: label,
              prefix: prefix,
            ),
            SizedBox(height: 15),
            Expanded(
                child: Container(
                    width:
                        query.width > 1200 ? query.width / 2 : query.width - 10,
                    height: query.height - 10,
                    child: newsWatch.loadingSearch
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : newsGridViewSearch(context, newsWatch.search)))
          ],
        )),
  );
}
