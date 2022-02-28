import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guide_app/screens/guide_details/guide_details.dart';
import 'package:guide_app/screens/guides/guides.dart';
import 'package:guide_app/screens/home/home.dart';
import 'package:guide_app/screens/splash/splash_screen.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UnityAds.init(gameId: '4634371', testMode: true);
  }

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guide App',
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/guides': (context) => GuidePage(),
      },
    );
  }
}
