import 'package:flutter/material.dart';

class carouselWidget extends StatelessWidget {
  const carouselWidget({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 197,
      child: ClipRRect(
        child: Image.asset(imageURL, fit: BoxFit.fill,),
      ),
    );
  }
}
