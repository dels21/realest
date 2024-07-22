import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Saved Page Content')),
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
