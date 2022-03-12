import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kuisoner_app/models/colors.dart';

class KotaDropDown extends StatefulWidget {
  bool isCanPick;

  DropDownControler controlerDropDown = DropDownControler();
  Function(String)? onStateChanged;

  List<String> data;
  KotaDropDown({
    Key? key,
    required this.isCanPick,
    this.onStateChanged,
    required this.data,
  }) : super(key: key);

  @override
  State<KotaDropDown> createState() => _KotaDropDownState();
}

class _KotaDropDownState extends State<KotaDropDown> {
  String? selected;
  hasFill() {
    setState(() {
      if (selected!.isNotEmpty) {
        widget.controlerDropDown.isHasFill = selected!;

        widget.onStateChanged!(widget.controlerDropDown.isHasFill);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8, left: 8),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
          color: cGreyYellow, borderRadius: BorderRadius.circular(15)),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.8,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: cDarkBlue,
            size: 25,
          ),
          isExpanded: true,
          value: selected,
          hint: Text(
            widget.isCanPick
                ? "Kota kamu saat ini"
                : "Silakan pilih domisili dahulu",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: cLightBlue,
            ),
          ),
          onChanged: widget.isCanPick
              ? (value) => setState(
                    () {
                      selected = value.toString();
                      hasFill();
                    },
                  )
              : null,
          items: widget.data.map(buildMenuItem).toList(),
        ),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: cDarkBlue,
        ),
      ),
    );

class DropDownControler {
  String isHasFill;
  DropDownControler({this.isHasFill = ""});
}
