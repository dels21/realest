import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/login.dart';
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * 0.2,
                        child: const ClipOval(
                          child: Image(
                            image: AssetImage("assets/Profile.jpeg"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: constraints.maxWidth * 0.5,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shrekquille',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '+6812345678989',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.settings,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    0,
                    25,
                    5,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Fullname',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Shrekquille Ditama',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    5,
                    25,
                    5,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'shrekquilleditama@gmail.com',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    5,
                    25,
                    5,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '+6812345678989',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    5,
                    25,
                    5,
                  ),
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Rumah Talenta BCA',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    15,
                    25,
                    15,
                  ),
                  child: SizedBox(
                      width: constraints.maxWidth,
                      child: const Row(
                        children: [
                          Text(
                            'Transaction History',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(Icons.assignment)
                        ],
                      )),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    15,
                    25,
                    15,
                  ),
                  child: SizedBox(
                      width: constraints.maxWidth,
                      child: const Row(
                        children: [
                          Text(
                            'Notification',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(Icons.notifications)
                        ],
                      )),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    25,
                    15,
                    25,
                    15,
                  ),
                  child: SizedBox(
                      width: constraints.maxWidth,
                      child: const Row(
                        children: [
                          Text(
                            'Privacy and Policy',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          Icon(Icons.lock)
                        ],
                      )),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                GestureDetector(
                  onTap: () => _showLogoutConfirmationDialog(context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      25,
                      15,
                      25,
                      15,
                    ),
                    child: SizedBox(
                        width: constraints.maxWidth,
                        child: const Row(
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ),
                            Spacer(),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            )
                          ],
                        )),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
              ],
            ),
          );
        },
      ),
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

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Are you sure want to'),
              RichText(
                text: const TextSpan(
                  text: 'Logout',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ' from Realest?',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          content: const Text(
              'Your data will keep in our application and you can access it if you login into your account again'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
