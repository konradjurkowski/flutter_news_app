import 'package:flutter/material.dart';
import 'package:flutter_news_app/providers/home_screen_provider.dart';
import 'package:flutter_news_app/providers/settings_screen_provider.dart';
import 'package:flutter_news_app/ui/screen/detail_screen.dart';
import 'package:flutter_news_app/ui/screen/home_screen.dart';
import 'package:flutter_news_app/ui/screen/setting_screen.dart';
import 'package:flutter_news_app/util/colors.dart';
import 'di/app_module.dart' as di;
import 'package:provider/provider.dart';

void main() {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsScreenProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: HomeScreen(),
        routes: {
          DetailScreen.routeName: (ctx) => DetailScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen()
        },
      ),
    );
  }
}
