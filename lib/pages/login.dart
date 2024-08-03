import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(40),
                  width: constraints.maxWidth > 600
                      ? 400
                      : constraints.maxWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/Logo.png',
                          width: 100,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 40)),
                      const Text(
                        'Login to Realest',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15)),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15)),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'forget your detail?',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15)),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                      Row(
                        children: [
                          Image.asset(
                            'assets/Horizontal Line.png',
                            width: constraints.maxWidth > 600
                                ? 100
                                : constraints.maxWidth * 0.25,
                          ),
                          const Spacer(),
                          const Text(
                            'or login with',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/Horizontal Line.png',
                            width: constraints.maxWidth > 600
                                ? 100
                                : constraints.maxWidth * 0.25,
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: SizedBox(
                            height: 60,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/Google Logo.png',
                                      width: 30,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Text(
                                  'Continue with Google',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: SizedBox(
                            height: 60,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/Apple Logo.png',
                                      width: 30,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Text(
                                  'Continue with Apple',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: SizedBox(
                            height: 60,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/Facebook Logo.png',
                                      width: 30,
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Text(
                                  'Continue with Meta',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'do not have an account? ',
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                              );
                            },
                            child: const Text(
                              'sign in',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
