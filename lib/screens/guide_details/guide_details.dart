import 'package:flutter/material.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class GuideDetailsPage extends StatefulWidget {
  
  GuideDetailsPage({ Key? key, required this.titles, required this.details, required this.index }) : super(key: key);

  List<String> titles;
  List<String> details;
  int index;

  @override
  State<GuideDetailsPage> createState() => _GuideDetailsPageState();
}

class _GuideDetailsPageState extends State<GuideDetailsPage> {
  @override
  Widget build(BuildContext context) {
    
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                onTap: () {
                  UnityAds.showVideoAd(placementId: 'Interstitial_Android');
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 27,)),
              SizedBox(height: _size.height * 0.03,),
              Text(widget.titles[widget.index], style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              SizedBox(height: _size.height * 0.01,),
              Text(widget.details[widget.index],
              style: TextStyle(
                color: Color.fromARGB(255, 123, 123, 123),
                fontSize: 15
              ),
              ),
            ],),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        if(widget.index > 0)
                          widget.index = widget.index - 1;
                        setState(() {
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Colors.black
                        ),
                        //width: _size.width * 0.90,
                        height: _size.height * 0.085,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0), 
                          child:Center(
                              child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 27,)),)
                        ),
                      ),
                  ),
                  SizedBox(width: _size.width * 0.03),
                  Expanded(
                    flex: 3,
                    child: Material(
                            elevation: 20,
                            shadowColor: Color.fromARGB(255, 252, 100, 24),
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            child: GestureDetector(
                              onTap: (){
                                if(widget.index < widget.titles.length - 1)
                                  widget.index = widget.index + 1;
                                setState(() {
                                });
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
                                //width: _size.width * 0.90,
                                height: _size.height * 0.085,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0), 
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Next Guide', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                                      Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 27,)
                                  ]),
                                ),
                              ),
                            ),
                          ),
                  ),
              ],),
            )
          ]),
        ),
      ),
    );
  }
}