import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';

class PenukaranSuksesPage extends StatefulWidget {
  const PenukaranSuksesPage({Key? key}) : super(key: key);

  @override
  State<PenukaranSuksesPage> createState() => _PenukaranSuksesPageState();
}

class _PenukaranSuksesPageState extends State<PenukaranSuksesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Expanded(
                  child: Column(
                children: [
                  Image.asset(
                    "assets/images/penukaran_sukses.png",
                    height: 280,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Kamu Berhasil Menukar poin",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Kode Voucher",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "239IEK2390",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    ),
                  ),
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (c) => CustomBottomNavBar()),
                        (route) => false);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: cDarkYellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.07),
                  ),
                  child: Text("KEMBALI",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: cWhite)),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
