import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';

const Color customBlue = Color(0xFF081F5C);

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const HomePage(),
                    transitionsBuilder: (_, animation, __, child) => child,
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              case 1:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SearchPage(),
                    transitionsBuilder: (_, animation, __, child) => child,
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              case 2:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SimulationPage(),
                    transitionsBuilder: (_, animation, __, child) => child,
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              case 3:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SavedPage(),
                    transitionsBuilder: (_, animation, __, child) => child,
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              case 4:
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const ProfilePage(),
                    transitionsBuilder: (_, animation, __, child) => child,
                    transitionDuration: Duration.zero,
                  ),
                );
                break;
              default:
                break;
            }
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: customBlue,
          unselectedItemColor: Colors.grey,
          iconSize: 30.0,
          selectedLabelStyle: const TextStyle(
            fontSize: 14.0,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12.0,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Simulation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
