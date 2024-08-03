import 'package:flutter/material.dart';

class NearbyWidget extends StatelessWidget {
  final String imagePath;

  const NearbyWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'Loading image from: $imagePath'); // Debug print to check the image path
    return Container(
      alignment: Alignment.center,
      width: 165,
      height: 220,
      margin: const EdgeInsets.only(right: 18),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: const Text(
        "Indonesia",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(0.5, 0.5),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
