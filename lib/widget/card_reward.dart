import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';

class CardReward extends StatefulWidget {
  int index;
  CardReward({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<CardReward> createState() => _CardRewardState();
}

class _CardRewardState extends State<CardReward> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: 340,
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
              voucherReward[widget.index]["image"],
              height: 95,
            ),
          ),
          Positioned(
            bottom: -1,
            child: Container(
              width: 340,
              height: 55,
              decoration: BoxDecoration(
                  color: cDarkBlue, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Text(
                  voucherReward[widget.index]["name"],
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
                height: 30,
                width: 140,
                decoration: BoxDecoration(
                  color: cDarkBlue,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Center(
                  child: Text(
                    voucherReward[widget.index]["poin"],
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: cDarkYellow),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
