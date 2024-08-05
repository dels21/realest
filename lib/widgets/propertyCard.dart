import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:realest/classes/property.dart';
import 'package:realest/pages/detail_properties.dart';

class PropertyWidget extends StatefulWidget {
  final Property property;

  const PropertyWidget({
    super.key,
    required this.property,
  });

  @override
  _PropertyWidgetState createState() => _PropertyWidgetState();
}

class _PropertyWidgetState extends State<PropertyWidget> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PropertiesDetailPages(property: widget.property),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.1,
              ),
              items: widget.property.imagePaths.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
                              color: const Color(0xFF081F5C),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 84,
                            height: 24,
                            child: const Text(
                              "Exclusive",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC9AD93),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 84,
                            height: 24,
                            child: const Text(
                              "House",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _isBookmarked = !_isBookmarked;
                          });
                        },
                        icon: Icon(
                          _isBookmarked ? Icons.star : Icons.star_border,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.property.propertyName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.property.propertyDescription,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "1900 sqm",
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "900 sqm lot",
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.property.propertyPrice,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Color(0xFF081F5C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Cicilan: 2 jutaan per bulan",
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  const Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.bed),
                          Text("6"),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(Icons.bathtub),
                          Text("8"),
                        ],
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(CupertinoIcons.car),
                          Text("12"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: CupertinoColors.activeBlue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text("PT Kobe Bryant Indonesia"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
