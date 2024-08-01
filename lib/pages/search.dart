import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search2.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';
import 'package:realest/widgets/carouselWidget.dart';
import 'package:realest/widgets/nearby.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:realest/widgets/popUpFilter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();

  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage2()),
        );
      }
    });
  }

  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool _isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // decoration: BoxDecoration(color: Colors.yellowAccent),
                  child: Row(
                    children: [
                      // Icon(Icons.arrow_back),
                      // SizedBox(width: 10,),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(_focusNode);
                          },
                          child: TextField(
                            focusNode: _focusNode,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              // suffixIcon: Icon(Icons.clear),
                              labelText: 'Search',
                              // hintText: 'hint text',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.amber)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            builder: (context) {
                              // Calculate 80% of the screen height
                              final height = MediaQuery.of(context).size.height * 0.8;
                              return Container(
                                height: height,
                                child: popUpFilter(),
                              );
                            },
                              transitionAnimationController:
                                  AnimationController(
                                duration: Duration(milliseconds: 1000),
                                // Duration of the animation
                                vsync: Navigator.of(context),
                              ));
                        },
                        child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                color: Color(0xFF308DFF),
                                borderRadius: BorderRadius.circular(10)),
                            child: Icon(
                              Icons.filter_alt,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),

                // Properties Nearby
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Properties Nearby", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),), Text("View More", style: TextStyle(fontSize: 15),)],
                ),
                SizedBox(height: 10,),
                SizedBox(
                    height: 220,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return NearbyWidget();
                        })),

                // Recommended
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Recommended", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)), Text("View More", style: TextStyle(fontSize: 15))],
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 12,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1.1,
                            // autoPlay: true,
                          ),
                          items: const [
                            carouselWidget(imageURL: 'assets/Apple Logo.png'),
                            carouselWidget(
                                imageURL: 'assets/Facebook Logo.png'),
                            carouselWidget(imageURL: 'assets/Google Logo.png'),
                            carouselWidget(imageURL: 'assets/Logo.png'),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF081F5C),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      width: 84,
                                      height: 24,
                                      child: Text(
                                        "Exclusive",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFC9AD93),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      width: 84,
                                      height: 24,
                                      child: Text("House",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: _toggleBookmark,
                                    icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Spanish Mansion in Jakarta Pusat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Menteng, Jakarta Pusat",
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  "1900 sqm",
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "900 sqm lot",
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Rp 1.000.000.000",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Color(0xFF081F5C),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Cicilan: 2 jutaan per bulan",
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.bed_rounded),
                                    Text("6")
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.bathtub_rounded),
                                    Text("8")
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.car),
                                    Text("12")
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: CupertinoColors.activeBlue,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("PT Kobe Bryant Indonesia")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
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
