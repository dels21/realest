import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Search Page Content')),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 1,
        onTabTapped: (index) {
          if (index == 1) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 0:
                    return const HomePage();
                  case 2:
                    return const SimulationPage();
                  case 3:
                    return const SavedPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const SearchPage();
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
