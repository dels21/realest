import 'package:flutter/material.dart';
import 'package:realest/pages/home.dart';
import 'package:realest/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _selectedItem = '+68';
  final List<String> _dropdownItems = ['+68', '+1', '+44', '+91'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/Logo.png',
                  width: 100,
                )),
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
                Row(
                  children: [
                    Container(
                      height:
                          65, // Set the height to match the text field height
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          items: _dropdownItems.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                        width:
                            10), // Add some space between the dropdown and the text field
                    Expanded(
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Number',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 20), // Adjust padding to match height
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15)),
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
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account? ',
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        'login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}