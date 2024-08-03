import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';
import 'package:realest/widgets/wishlistCard.dart';

// Dummy data for properties
List<Map<String, String>> dummyProperties = [
  {
    'title': 'Spanish Mansion',
    'price': '\$1,200/month',
    'imageUrl': 'assets/1.png',
    'address': '123 Example Street',
  },
  {
    'title': 'Modern Villa in Bali',
    'price': '\$1,500/month',
    'imageUrl': 'assets/2.png',
    'address': '456 Example Avenue',
  },
  // Add more properties as needed
];

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Properties',
            style: TextStyle(
                color: Color(0xFF081F5C),
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: (1 / 1.4),
          ),
          itemCount: dummyProperties.length,
          itemBuilder: (context, index) {
            final property = dummyProperties[index];
            return Center(
              child: WishlistCard(
                title: property['title']!,
                price: property['price']!,
                imageUrl: property['imageUrl']!,
                address: property['address']!,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 3,
        onTabTapped: (index) {
          if (index == 3) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const SearchPage();
                  case 2:
                    return const SimulationPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const SavedPage();
                }
              },
              transitionsBuilder: (_, animation, __, child) => child,
              transitionDuration: Duration.zero,
            ),
          );
        },
      ),
    );
  }
}
