import 'package:flutter/material.dart';

class NearbyWidget extends StatelessWidget {
  const NearbyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 165,
      height: 220,
      margin: EdgeInsets.only(right: 18),
      decoration: BoxDecoration(color: Colors.yellowAccent, borderRadius: BorderRadius.circular(12)),
      child: Text("Nama Kota"),
    );
  }
}

