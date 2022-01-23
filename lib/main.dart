import 'package:flutter/material.dart';
import 'package:github_profile/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github Profile',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
