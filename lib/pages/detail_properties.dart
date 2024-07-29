import 'package:flutter/material.dart';

class PropertiesDetailPages extends StatefulWidget {
  const PropertiesDetailPages({super.key});

  @override
  _PropertiesDetailPagesState createState() => _PropertiesDetailPagesState();
}

class _PropertiesDetailPagesState extends State<PropertiesDetailPages> {
  // Variable to store the current image
  Color _currentImageColor = Colors.amber;

  // List of images
  final List<Color> _images = [
    Colors.amber, // Image 1
    Colors.blue, // Image 2
    Colors.black, // Image 3
    Colors.green // Image 4
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.8,
                    color: _currentImageColor, // Use current image color
                    child: Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          actions: [
                            IconButton(
                              icon: const Icon(Icons.share),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                      children: List.generate(
                        _images.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentImageColor = _images[index];
                            });
                          },
                          child: Container(
                            color: _images[index],
                            width: MediaQuery.of(context).size.width / 4,
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
                          'Spanish Mansion',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'House > Indonesia > Jakarta Pusat > Menteng',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                '1900 sqm',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '900 sqm lot',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '\$6,521 sqm',
                                style: TextStyle(
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
                                '5 beds',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '6 baths',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '3 carports',
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
                        Container(
                          color: Colors.red,
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
                          leading: Icon(Icons.local_fire_department),
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
                          leading: Icon(Icons.school),
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
                        const Text(
                          'A Spanish mansion, often referred to as a hacienda or villa, embodies a distinctive architectural style deeply influenced by Spain\'s rich history, culture, and climate. Characterized by smooth stucco walls, red clay tile roofs, and arched doorways and windows, these homes exude rustic elegance. Central courtyards with fountains, lush gardens, and seating areas serve as serene outdoor living spaces, while interiors feature terracotta or ceramic tile floors, wooden beams, and ornate fireplaces that create a warm, inviting atmosphere. The architecture seamlessly blends Moorish and Mediterranean influences, evident in the intricate tile work and harmonious integration of indoor and outdoor spaces. With lush gardens, swimming pools, and outdoor kitchens designed for alfresco entertaining, a Spanish mansion offers a luxurious lifestyle that values elegance, warmth, and a deep connection with nature.',
                          style: TextStyle(
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
                            backgroundColor: const Color.fromRGBO(52, 199, 89,
                                1), // Replace with your desired color
                          ),
                          onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
