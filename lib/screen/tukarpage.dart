import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';

class TukarPageScreen extends StatefulWidget {
  const TukarPageScreen({Key? key}) : super(key: key);

  @override
  State<TukarPageScreen> createState() => _TukarPageScreenState();
}

class _TukarPageScreenState extends State<TukarPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        physics: const BouncingScrollPhysics(),
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
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 37, right: 35),
            height: 400,
            child: ListView.builder(
                itemCount: voucherReward.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: cDarkBlue, width: 1.3),
                      borderRadius: BorderRadius.circular(8),
                      color: cGreyYellow,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            voucherReward[index]["image"],
                            height: 90,
                          ),
                        ),
                        Positioned(
                          bottom: -1,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.82,
                            height: 55,
                            decoration: BoxDecoration(
                                color: cDarkBlue,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Text(
                                voucherReward[index]["name"],
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: cDarkYellow),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 15,
                            right: 20,
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: cDarkBlue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, left: 15),
                                child: Text(
                                  voucherReward[index]["poin"],
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: cDarkYellow),
                                ),
                              ),
                            ))
                      ],
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
