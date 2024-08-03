import 'package:flutter/material.dart';
import 'package:realest/classes/property.dart';
import 'package:realest/pages/search2.dart';
import 'package:realest/widgets/bottomNavigation.dart';
import 'package:realest/widgets/nearby.dart';
import 'package:realest/widgets/popUpFilter.dart';
import 'package:realest/widgets/propertyCard.dart';

class ListPropertiesPage extends StatefulWidget {
  const ListPropertiesPage({super.key});

  @override
  State<ListPropertiesPage> createState() => _ListPropertiesPageState();
}

class _ListPropertiesPageState extends State<ListPropertiesPage> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
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
                            transitionAnimationController: AnimationController(
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
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
