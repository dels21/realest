import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio:
              (1 / 1.4), // Adjust aspect ratio to fit your content
          crossAxisSpacing: 8.0,
          // mainAxisSpacing: 16.0,
          children: List.generate(16, (index) {
            return Center(
              child: WishlistCard(
                title: 'Title',
                price: '\$XXX/month',
                imageUrl: "assets/gambar_rumah.png",
                address: '123 Example Street',
              ),
            );
          }),
        ),
      ),
    );
  }
}

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
  bool _isFavorited = true;

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
                  _isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorited ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
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
