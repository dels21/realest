import 'package:flutter/material.dart';
import 'package:realest/classes/property.dart';

class PropertiesDetailPages extends StatefulWidget {
  final Property property;

  const PropertiesDetailPages({super.key, required this.property});

  @override
  _PropertiesDetailPagesState createState() => _PropertiesDetailPagesState();
}

class _PropertiesDetailPagesState extends State<PropertiesDetailPages> {
  String _currentImagePath = '';

  @override
  void initState() {
    super.initState();
    if (widget.property.imagePaths.isNotEmpty) {
      _currentImagePath = widget.property.imagePaths[0];
    }
  }

  void _showContactPopup() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Wrap(
            children: [
              ListTile(
                leading: GestureDetector(
                  child: const Icon(Icons.close_rounded),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  'Contact Now',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Contact Agent'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Call +62123456789'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text('Message +62123456789'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.wechat),
                title: const Text('We Chat'),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final property = widget.property;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(_currentImagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent
                          ],
                          stops: [0.1, 0.9],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    children: List.generate(
                      property.imagePaths.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentImagePath = property.imagePaths[index];
                          });
                        },
                        child: Container(
                          color: Colors.grey,
                          width: MediaQuery.of(context).size.width /
                              property.imagePaths.length,
                          height: MediaQuery.of(context).size.width /
                              property.imagePaths.length,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.0),
                            ),
                            child: Image.asset(
                              property.imagePaths[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'House > Indonesia > Jakarta Pusat > Menteng',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        property.propertyName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              '1900 sqm',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              '900 sqm lot',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              property.propertyPrice,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              '3 beds',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '8 baths',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '12 carports',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.amber,
                            radius: 30,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PT Kobe Bryant Indonesia',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                '2 years with Realest',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Image(
                        image: AssetImage('assets/Map.png'),
                        height: 150,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Jl. Pakuan No.3, Sumur Batu, Kec. Babakan Madang, Kabupaten Bogor, Jawa Barat 16810',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Features',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const ListTile(
                        leading: Icon(Icons.pool),
                        title: Text('Swimming Pool'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.work_off),
                        title: Text('Office'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.security),
                        title: Text('Security Officer'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.local_florist),
                        title: Text('Garden'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.hot_tub),
                        title: Text('Sauna'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Public Facility',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const ListTile(
                        leading: Icon(Icons.flight),
                        title: Text('Andreas Li Airport'),
                        trailing: Text('637m'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.train),
                        title: Text('St. BCA Learning Institute'),
                        trailing: Text('830m'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.directions_car),
                        title: Text('JORR Highway Gate 1'),
                        trailing: Text('922m'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Nearby Place',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const ListTile(
                        leading: Icon(Icons.shopping_bag),
                        title: Text('Scuderia Shopping Mall'),
                        trailing: Text('332m'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.school),
                        title: Text('Kharisma Private School'),
                        trailing: Text('546m'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.local_pharmacy),
                        title: Text('Orange Pharmacy'),
                        trailing: Text('641m'),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        property.propertyDescription,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$1,000,000',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$9,410 - \$21,300 per month',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                                bottom: Radius.circular(15)),
                          ),
                          backgroundColor: const Color.fromRGBO(52, 199, 89, 1),
                        ),
                        onPressed: _showContactPopup,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.contact_mail),
                            SizedBox(width: 10),
                            Text(
                              'Contact',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SafeArea(
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.star, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
