import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';

class PaymentSuccesPage extends StatelessWidget {
  const PaymentSuccesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/payment_success_image.png",
                    height: 200,
                    width: 248,
                  ),
                  Text(
                    "Kuesioner kamu berhasil disebarkan !",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: cDarkBlue),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (c) => CustomBottomNavBar()),
                    (route) => false);
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: cDarkYellow,
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
    );
  }
}
