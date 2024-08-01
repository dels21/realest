import 'package:flutter/material.dart';

class searchWidget extends StatelessWidget {
  const searchWidget({super.key, required this.title, required this.price, required this.location, required this.imageURL});

  final String title;
  final String price;
  final String location;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, right: 10, top: 10),
            width: 72,
            height: 72,
            decoration: BoxDecoration(color: Colors.yellowAccent),
            child: ClipRRect(child: Image.asset(imageURL, fit: BoxFit.fill,)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontFamily: 'Poppins'),),
              Text("Rp " + price, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),),
              Text(location, style: TextStyle(fontSize: 11),),
            ],
          )
        ],
      ),
    );
  }
}
