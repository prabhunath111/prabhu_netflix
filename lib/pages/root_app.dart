import 'package:flutter/material.dart';
import 'package:netflix_prabhu/json/root_app_json.dart';
import 'package:netflix_prabhu/pages/coming_soon_page.dart';
import 'package:netflix_prabhu/pages/downloads_page.dart';
import 'package:netflix_prabhu/pages/home_page.dart';
import 'package:netflix_prabhu/pages/search_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }
  Widget getFooter() {
    return Container(
      height: 50,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      activeTab = index;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(items[index]['icon'], color: Colors.white),
                      SizedBox(height: 5),
                      Text(
                        items[index]['text'],
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        ComingsoonPage(),
        SearchPage(),
        DownloadsPage()
      ],
    );
  }
}
