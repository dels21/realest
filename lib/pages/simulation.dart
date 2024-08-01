import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: SafeArea(
        child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(20),
            child:
            Column(
              children: [
                Text("Simulasi KPR", textAlign: TextAlign.center, ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  decoration: BoxDecoration(color: Color(0xFF081F5C), borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text("Estimasi Angsuran/Bulan", style: TextStyle(color: Colors.white),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rp 100.000.000", style: TextStyle(color: Colors.white)),
                          Icon(Icons.info_rounded, color: Colors.white,)
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Harga Properti", textAlign: TextAlign.start,),
                    TextField(
                      decoration: InputDecoration(
                        prefixText: "Rp ",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    )
                  ],
                )
              ],
            )
        ),
      ),
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
