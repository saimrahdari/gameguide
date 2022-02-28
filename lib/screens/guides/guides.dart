import 'package:flutter/material.dart';
import 'package:guide_app/screens/guide_details/guide_details.dart';

class GuidePage extends StatelessWidget {

  List<String> titles = [
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum", 
    "Lorem Ipsum"];
  List<String> details = [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dictum vel venenatis morbi"
  ];

  @override
  Widget build(BuildContext context) {
  Size _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 27,)),
                SizedBox(width: _size.width * 0.02),
                Text('Guides', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
              ],),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: _size.height * 0.02,),
                itemCount: titles.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  GuideDetailsPage(titles: titles, details: details, index: index)),
                    );
                  },
                  child: Container(
                          width: _size.width,
                          height: _size.height * 0.15,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 247, 247),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text(titles[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                              Text(details[index], style: TextStyle(color: Color.fromARGB(255, 123, 123, 123), fontSize: 15),)
                            ]),
                          ),
                        ),
                ),
              ),  
            ),
            
    //
          ]),
      ),
    );
  }
}