import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/component/navigator.dart';
import 'package:news_app/screens/web_views_screen.dart';

Widget newsGridView(BuildContext context, List<dynamic> list) {
  var query = MediaQuery.of(context).size;
  return GridView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: query.width < 800
            ? 1
            : query.width < 1200
                ? 2
                : 3,
        childAspectRatio: query.width <= 350 ? 1.5 : 2,
      ),
      itemBuilder: (context, i) => InkWell(
            onTap: () {
              navigatorTo(context, WebViewScreen(list[i].url));
            },
            child: Container(
              margin: query.width < 800
                  ? const EdgeInsets.all(10)
                  : const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: query.width < 800
                    ? const EdgeInsets.all(10)
                    : const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              list[i].urlImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            list[i].publishedAt.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            list[i].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(height: 10),
                          Text(
                            list[i].description,
                            maxLines: (query.height * 4 / 900).round(),
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
