import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  void _timer() {
    Future.delayed(const Duration(seconds: 5), () {
      UnityAds.showVideoAd(placementId: 'Interstitial_Android');
      Navigator.pushNamed(context, '/home');
    });
  }

  @override
  void initState() {
    _timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
                width: _size.width * 0.6,
                height: _size.height * 0.35,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),),
      ),
    );
  }
}
