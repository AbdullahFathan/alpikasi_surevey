import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/screen/penukaran_sukses_page.dart';
import 'package:kuisoner_app/widget/card_reward.dart';

class PenjelasanRewardPage extends StatefulWidget {
  int index;
  PenjelasanRewardPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<PenjelasanRewardPage> createState() => _PenjelasanRewardPageState();
}

class _PenjelasanRewardPageState extends State<PenjelasanRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/images/arrow_left.png",
                    height: 28,
                    width: 22,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "Detail Voucher",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: cDarkBlue,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(child: CardReward(index: widget.index)),
          const SizedBox(
            height: 25,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  "Syarat dan Ketentuan",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: cDarkBlue,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 18),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt utlabore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisiut aliquip ex ea.",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: cLightBlue,
                  ),
                  maxLines: 5,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Poin yang dibutuhkan ",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: cDarkBlue,
                      ),
                    ),
                    Text(
                      "1000 Poin ",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: cDarkBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => PenukaranSuksesPage()));
              },
              style: TextButton.styleFrom(
                backgroundColor: cDarkYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07),
              ),
              child: Text("TUKAR POIN",
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
      )),
    );
  }
}
