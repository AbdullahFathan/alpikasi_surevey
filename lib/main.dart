import 'package:flutter/material.dart';
import 'package:kuisoner_app/screen/homepage.dart';
import 'package:kuisoner_app/screen/isi_kuisoner_page.dart';

import 'package:kuisoner_app/screen/login.dart';
import 'package:kuisoner_app/screen/tambahkuisoner.dart';
import 'package:kuisoner_app/screen/tukarpage.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
