import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realest/classes/property.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/list_properties.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search2.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';
import 'package:realest/widgets/carouselWidget.dart';
import 'package:realest/widgets/nearby.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:realest/widgets/popUpFilter.dart';
import 'package:realest/widgets/propertyCard.dart';

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
          MaterialPageRoute(builder: (context) => const SearchPage2()),
        );
      }
    });
  }

  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool _isBookmarked = false;
  List<String> _nearby = [
    'assets/1.png',
    'assets/2.png',
    'assets/3.png',
    'assets/4.png'
  ];
  List<Property> dummyProperties = [
    Property(
      imagePaths: [
        'assets/1.png',
        'assets/2.png',
        'assets/3.png',
        'assets/4.png'
      ],
      propertyName: 'Spanish Mansion in Jakarta Pusat',
      propertyDescription: 'Menteng, Jakarta Pusat',
      propertyPrice: 'Rp 1.000.000.000',
    ),
    Property(
      imagePaths: [
        'assets/3.png',
        'assets/4.png',
        'assets/5.png',
        'assets/6.png'
      ],
      propertyName: 'Modern Villa in Bali',
      propertyDescription: 'Seminyak, Bali',
      propertyPrice: 'Rp 2.500.000.000',
    ),
    Property(
      imagePaths: [
        'assets/5.png',
        'assets/6.png',
        'assets/7.png',
        'assets/8.png'
      ],
      propertyName: 'Luxury Condo in Jakarta',
      propertyDescription: 'Kebayoran Baru, Jakarta',
      propertyPrice: 'Rp 3.000.000.000',
    ),
    Property(
      imagePaths: [
        'assets/7.png',
        'assets/8.png',
        'assets/1.png',
        'assets/2.png'
      ],
      propertyName: 'Cozy Apartment in Bandung',
      propertyDescription: 'Dago, Bandung',
      propertyPrice: 'Rp 750.000.000',
    ),
    // Add more properties as needed
  ];

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
            margin: const EdgeInsets.all(20),
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
                              prefixIcon: const Icon(Icons.search),
                              // suffixIcon: Icon(Icons.clear),
                              labelText: 'Search',
                              // hintText: 'hint text',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.amber)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              builder: (context) {
                                // Calculate 80% of the screen height
                                final height =
                                    MediaQuery.of(context).size.height * 0.8;
                                return Container(
                                  height: height,
                                  child: const popUpFilter(),
                                );
                              },
                              transitionAnimationController:
                                  AnimationController(
                                duration: const Duration(milliseconds: 1000),
                                // Duration of the animation
                                vsync: Navigator.of(context),
                              ));
                        },
                        child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                color: const Color(0xFF308DFF),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.filter_alt,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                // Properties Nearby
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Properties Nearby",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListPropertiesPage()),
                        );
                      },
                      child: const Text(
                        "View More",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 220,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return NearbyWidget(imagePath: _nearby[index]);
                        })),

                // Recommended
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Recommended",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListPropertiesPage()),
                        );
                      },
                      child: const Text(
                        "View More",
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: dummyProperties.map((property) {
                    return Column(
                      children: [
                        PropertyWidget(
                          property: property,
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    );
                  }).toList(),
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
