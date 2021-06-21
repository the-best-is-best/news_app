import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/local/cache_helper.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    bool isDark = CacheHelper.getBoolean(key: "isDark");
    ThemeMode themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    context.read<NewsProvider>().getThemeMode(themeMode);
    Timer(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/home'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),
          ),
        ],
      ),
    );
  }
}
