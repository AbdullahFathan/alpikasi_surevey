import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/screen/akun_page.dart';
import 'package:kuisoner_app/screen/ubah_personal_data.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/user_picutre.png"),
                radius: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Ubah Gambar Profil",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: cDarkBlue,
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              //==Akun==
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AkunPage()));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  margin: const EdgeInsets.only(bottom: 13),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cGreyYellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Akun",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: cDarkBlue,
                      ),
                    ],
                  ),
                ),
              ),

              //==Ubah Personal Data===
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UbahPersonalDataPage()));
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  margin: const EdgeInsets.only(bottom: 13),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cGreyYellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ubah Personal Data",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: cDarkBlue,
                      ),
                    ],
                  ),
                ),
              ),

              //===Keluar / Logout ==

              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: cGreyYellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Keluar",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: cDarkBlue,
                      ),
                    ],
                  ),
                ),
              ),

              //! main Childreen
            ],
          ),
        ),
      ),
    );
  }
}
