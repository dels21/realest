import 'package:flutter/material.dart';
import 'package:realest/pages/detail_properties.dart';
import 'package:realest/pages/saved.dart';
import 'package:realest/widgets/wishlistCard.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'SFPro',
      ),
      home: PropertiesDetailPages(),
    );
  }
}
