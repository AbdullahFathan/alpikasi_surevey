import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kuisoner_app/models/colors.dart';

class DropDownCustom extends StatefulWidget {
  String kataHint;
  DropDownControler controlerDropDown = DropDownControler();
  Function(String)? onStateChanged;

  List<String> data;
  DropDownCustom({
    Key? key,
    required this.kataHint,
    this.onStateChanged,
    required this.data,
  }) : super(key: key);

  @override
  State<DropDownCustom> createState() => _DropDownCustomState();
}

class _DropDownCustomState extends State<DropDownCustom> {
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
            widget.kataHint,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: cLightBlue,
            ),
          ),
          onChanged: (value) => setState(
            () {
              selected = value.toString();
              hasFill();
            },
          ),
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
