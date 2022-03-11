import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';
import 'package:kuisoner_app/screen/penjelasan_reward_page.dart';
import 'package:kuisoner_app/screen/riwayat_page.dart';
import 'package:kuisoner_app/widget/card_reward.dart';

class TukarPageScreen extends StatefulWidget {
  const TukarPageScreen({Key? key}) : super(key: key);

  @override
  State<TukarPageScreen> createState() => _TukarPageScreenState();
}

class _TukarPageScreenState extends State<TukarPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cDarkYellow,
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 230,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: cDarkBlue,
                ),
              ),
              Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: cWhite,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: cLightBlue,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Cari voucher",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: cLightBlue,
                          ),
                        ),
                      ],
                    ),
                  )),
              Positioned(
                bottom: 40,
                left: MediaQuery.of(context).size.width * 0.1,
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: cWhite,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Poin",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff969696),
                        ),
                      ),
                      Text(
                        "243000",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: cDarkYellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: MediaQuery.of(context).size.width * 0.1,
                  bottom: 40,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RiwayatPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 3),
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: cWhite,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon_riwayat.png",
                            height: 35,
                          ),
                          Text(
                            "Riwayat",
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cDarkBlue),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 37, right: 35, top: 15),
            height: 600,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: voucherReward.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PenjelasanRewardPage(index: index)));
                    },
                    child: CardReward(
                      index: index,
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
