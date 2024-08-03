import 'dart:io';

import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/profile.dart';
import 'package:realest/pages/search.dart';
import 'package:realest/pages/simulation.dart';
import 'package:realest/widgets/bottomNavigation.dart';
import 'package:realest/widgets/wishlistCard.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor:
            Colors.transparent, //biar pas ke scroll gak berubah warnanya
        title: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.17,
            child: Image(
              image: AssetImage("assets/Logo.png"),
            ),
          ),
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
                imageUrl: "assets/Logo.png",
                address: '123 Example Street',
              ),
            );
          }),
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
