import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { 
  bool _showBanner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: UnityBannerAd(
                      placementId: 'Banner_Android',
                  ),
                ),
                SizedBox(height: _size.height * 0.02,),
                Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25),),
                    child: SizedBox(  
                      width: _size.width * 0.9,
                      height: _size.height * 0.49,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.asset(
                          'assets/images/pubg.png',
                        ),
                      ),
                    ),
                  ),
                ),
            
                SizedBox(height: _size.height * 0.03,),
            
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text('PUBG', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ),
            
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi nunc pellentesque dui scelerisque convallis.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 123, 123, 123)
                    ),
                  ),
                ), 
              
                SizedBox(height: _size.height * 0.03,),
              
                Center(
                  child: Material(
                    elevation: 20,
                    shadowColor: Color.fromARGB(255, 252, 100, 24),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: GestureDetector(
                      onTap: (){
                        UnityAds.showVideoAd(placementId: 'Interstitial_Android');
                        Navigator.pushNamed(context, '/guides');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 252, 100, 24),
                              Color.fromARGB(255, 184, 72, 16)
                            ]
                          ),
                        ),
                        width: _size.width * 0.90,
                        height: _size.height * 0.085,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0), 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Launch Now', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                              Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 27,)
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
    );
  }
}

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'your_android_game_id';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'your_banner_ad_placement_id';
  }
}