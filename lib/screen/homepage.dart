import 'package:flutter/material.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "HomePage",
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}
