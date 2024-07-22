import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class SimulationPage extends StatelessWidget {
  const SimulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Simulation Page Content')),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 2,
        onTabTapped: (index) {
          if (index == 2) return; // Current page
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) {
                switch (index) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const SearchPage();
                  case 3:
                    return const SavedPage();
                  case 4:
                    return const ProfilePage();
                  default:
                    return const SimulationPage();
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
