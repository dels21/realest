import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  decoration: BoxDecoration(color: Colors.yellowAccent, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child: Image.asset("assets/RTB.png", fit: BoxFit.fill, )
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(CupertinoIcons.bell_fill, color: Colors.white,),
                          SizedBox(width: 20,),
                          Icon(Icons.message, color: Colors.white,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Find your perfect home", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),),
                      SizedBox(height: 20,),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search, color: Colors.grey,),
                          // suffixIcon: Icon(Icons.clear),
                          hintText: 'Enter a property, neighbourhood, etc',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 0;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 96,
                              height: 48,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0 ? Color(0xFF308DFF) : Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                              ),
                              child: Text('Buy', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 96,
                              height: 48,
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1 ? Color(0xFF308DFF) : Colors.white.withOpacity(0.4),
                                border: _selectedIndex == 1 ? Border.all(color: Color(0xFF308DFF)) : Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                              ),
                              child: Text('Rent', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Categories", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 148,
                    child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index){
                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 12,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            width: 128,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.house_rounded),
                                Text("House")
                              ],
                            ),
                          );
                        }
                    ),
                  ),

                  SizedBox(height: 10,),
                  Text("Discover Properties", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index){
                          return Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                    height: 240,
                                    width: 220,
                                    child:
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset("assets/Rumah1.png", fit: BoxFit.fill,)
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: 220,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text("Bintaro,", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),),
                                            Text("Tangerang Selatan", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),),
                                          ],
                                        ),
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          child: Text("Discover", style: TextStyle(color: Colors.white),),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: 200,
                                    height: 116,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Color(0xFFC9AD93)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Andreas, 23 y.o", style: TextStyle(color: Colors.white),),
                                        Text("I bought my new house on Realest and it really worth it", style: TextStyle(color: Colors.white) )
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                        height: 116,
                                        width: 200,
                                        child:
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.asset("assets/Rumah1.png", fit: BoxFit.fill,)
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 116,
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("Menteng, Jakarta", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.bottomCenter,
                                              child: Text("Discover", style: TextStyle(color: Colors.white),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                        height: 116,
                                        width: 200,
                                        child:
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Image.asset("assets/Rumah1.png", fit: BoxFit.fill,)
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 116,
                                        width: 200,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("Sentul, Bogor", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w800),),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.bottomCenter,
                                              child: Text("Discover", style: TextStyle(color: Colors.white),),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    width: 200,
                                    height: 116,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12), color: Colors.white,
                                        boxShadow:[
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.25),
                                            blurRadius: 0.2
                                          )
                                        ]
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Adeline, 23 y.o", style: TextStyle(color: Color(0xFFC9AD93)),),
                                        Text("I build my new house using this application and now i’m a billionaire.", style: TextStyle(color: Color(0xFFC9AD93) ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                height: 240,
                                width: 200,
                                child:
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset("assets/Rumah1.png", fit: BoxFit.fill,)
                                ),
                              ),
                            ],
                          );
                        }
                    ),
                  ),

                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: 380,
                    height: 96,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 8
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: Color(0xFF081F5C), borderRadius: BorderRadius.circular(100)),
                          child: Icon(Icons.calculate, color: Colors.white,),
                        ),
                        Container(
                          width: 240,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mortgage Simulation", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                              Text("Calculate your property payment for every month")
                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.arrow_right_circle),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: 380,
                    height: 96,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: Color(0xFF081F5C), borderRadius: BorderRadius.circular(100)),
                          child: Icon(Icons.star, color: Colors.white,),
                        ),
                        Container(
                          width: 240,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Property Wishlist", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                              Text("Save your property and see it later, so you won’t forget")
                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.arrow_right_circle),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(16),
                    width: 380,
                    height: 96,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 8
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(color: Color(0xFF081F5C), borderRadius: BorderRadius.circular(100)),
                          child: Icon(Icons.person, color: Colors.white,),
                        ),
                        Container(
                          width: 240,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Profile Preferences", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),),
                              Text("Customize your profile, so you’ll see your own custom")
                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.arrow_right_circle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),



      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
        onTabTapped: (index) {
          if (index == 0) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 1:
                    return const SearchPage();
                  case 2:
                    return const SimulationPage();
                  case 3:
                    return const SavedPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const HomePage();
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