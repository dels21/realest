import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/searchWidget.dart';

import '../widgets/bottomNavigation.dart';

class SearchPage2 extends StatefulWidget {
  const SearchPage2({super.key});

  @override
  State<SearchPage2> createState() => _SearchPage2State();
}

class _SearchPage2State extends State<SearchPage2> {

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final List<searchWidget> items = [
    searchWidget(title: "New York Penthouse", price: "4,000,000", location: "New York, USA", imageURL: 'assets/Rumah1.png',),
    searchWidget(title: "Rumah Talenta BCA", price: "25,000,000", location: "Sentul Selatan, Indonesia", imageURL: 'assets/RTB.png',),
    searchWidget(title: "Apple", price: "20000000", location: "usa", imageURL: 'assets/Rumah1.png',),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchPage()),
                          );
                        },
                        child: Icon(Icons.arrow_back)
                    ),
                    SizedBox(width: 10,),
                    Flexible(
                        child: TextField(
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Search',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.amber)
                              ),
                            )
                        )
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text("Recent Search", style: TextStyle(fontSize: 16),),
                SizedBox(height: 10,),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.72,
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (_, index){
                        final item = items[index];
                        return searchWidget(title: item.title, price: item.price, location: item.location, imageURL: item.imageURL);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 1,
        onTabTapped: (index) {
          if (index == 1) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 0:
                    return const HomePage();
                  case 2:
                    return const SimulationPage();
                  case 3:
                    return const SavedPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const SearchPage();
                }
              },
              transitionsBuilder: (_, animation, __, child) => child,
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
    );
  }
}