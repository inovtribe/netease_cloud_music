import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netease_cloud_music/pages/splash_page.dart';
import 'package:netease_cloud_music/provider/play_songs_provider.dart';
import 'package:netease_cloud_music/provider/profile_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ProfileProvider(),),
          ChangeNotifierProvider(create: (_) => PlaySongsProvider()..init(),),
        ],
        child: Consumer<ProfileProvider>(
          builder: (context, profileProvider, _) {
            return BotToastInit(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  navigatorObservers: [BotToastNavigatorObserver()],
                  theme: ThemeData(
                    primaryColor: Color(0xffDD001B),
                    primarySwatch: Colors.red,
                    backgroundColor: Colors.white,
                  ),
                  home: SplashPage(),
                )
            );
          },
        ),
    );
  }

}
