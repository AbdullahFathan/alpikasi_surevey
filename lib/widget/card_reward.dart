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
      margin: const EdgeInsets.only(bottom: 14),
      width: 340,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset("assets/images/latar_voucher2.jpg"),
          ),
          Positioned(
              top: 40,
              left: 100,
              child: Image.asset(
                voucherReward[widget.index]["image"],
                height: 100,
              )),
          Positioned(
              top: 10,
              left: 125,
              child: Text(
                voucherReward[widget.index]["poin"],
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600, color: cWhite),
              )),
          Positioned(
              bottom: 25,
              left: 75,
              child: Text(
                voucherReward[widget.index]["name"],
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: cDarkBlue),
              )),
        ],
      ),
    );
  }
}
