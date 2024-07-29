import 'package:flutter/material.dart';

class WishlistCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String address;

  WishlistCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.address,
  });

  @override
  _WishlistCardState createState() => _WishlistCardState();
}

class _WishlistCardState extends State<WishlistCard> {
  bool _isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Makes the card auto-size
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(widget.imageUrl),
              IconButton(
                icon: Icon(
                  _isSaved ? Icons.star : Icons.star_border,
                  color: _isSaved ? Colors.yellow : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isSaved = !_isSaved;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.price,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 16.0,
                    ),
                    SizedBox(width: 4.0),
                    Expanded(
                      child: Text(
                        widget.address,
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
