import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/local/cache_helper.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.int();
  await CacheHelper.init();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NewsProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.white,

          //appBar
          appBarTheme: AppBarTheme(
            titleSpacing: 20,
            iconTheme: IconThemeData(color: Colors.black87),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          //bottomNavBar
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            unselectedItemColor: Colors.black87,
            selectedItemColor: Colors.deepOrange,
            elevation: 20,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            bodyText2: TextStyle(fontSize: 12, color: Colors.black),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange.shade300)),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarTheme(
          titleSpacing: 20,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: HexColor('333739'),
          elevation: 0,
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.deepOrange,
          backgroundColor: HexColor('333739'),
          elevation: 20,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange.shade900),
        textTheme: TextTheme(
          bodyText1: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          bodyText2: TextStyle(fontSize: 12, color: Colors.white, height: 1.5),
        ),
      ),
      themeMode: context.watch<NewsProvider>().themeMode,
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => NewsScreen(),
      },
    );
  }
}
