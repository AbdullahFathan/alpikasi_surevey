import 'package:flutter/material.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/screen/homepage.dart';
import 'package:kuisoner_app/screen/profile_page.dart';
import 'package:kuisoner_app/screen/tambahkuisoner.dart';
import 'package:kuisoner_app/screen/tukarpage.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screen = [
    HomePageScreen(),
    TambahKuisonerScreen(),
    TukarPageScreen(),
    ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Image.asset(
                      "assets/images/home_selected.png",
                      width: 35,
                      height: 35,
                    )
                  : Image.asset(
                      "assets/images/home_unselected.png",
                      width: 35,
                      height: 35,
                    ),
              label: "Beranda"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Image.asset(
                      "assets/images/chart_selected.png",
                      width: 32,
                      height: 32,
                    )
                  : Image.asset(
                      "assets/images/chart_unselected.png",
                      width: 27,
                      height: 27,
                    ),
              label: "Tambah Kuisoner"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Image.asset(
                      "assets/images/tukar_selected.png",
                      width: 32,
                      height: 32,
                    )
                  : Image.asset(
                      "assets/images/tukar_unselected.png",
                      width: 32,
                      height: 32,
                    ),
              label: "Tukar"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Image.asset(
                      "assets/images/profile_selected.png",
                      width: 37,
                      height: 37,
                    )
                  : Image.asset(
                      "assets/images/profile_unselected.png",
                      width: 37,
                      height: 37,
                    ),
              label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTap,
        backgroundColor: cWhite,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        selectedItemColor: cDarkYellow,
      ),
    );
  }
}
