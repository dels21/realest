import 'package:flutter/material.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Home Page Content')),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 0,
        onTabTapped: (index) {
          if (index == 0) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 1:
                    return const SearchPage();
                  case 2:
                    return const SimulationPage();
                  case 3:
                    return const SavedPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const HomePage();
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
