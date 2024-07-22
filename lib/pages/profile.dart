import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Profile Page Content')),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 4,
        onTabTapped: (index) {
          if (index == 4) return; // Current page
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
                  case 3:
                    return const SavedPage();
                  default:
                    return const ProfilePage();
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
