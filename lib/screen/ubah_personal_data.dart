import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';

import '../widget/dropdown_custom.dart';

class UbahPersonalDataPage extends StatefulWidget {
  const UbahPersonalDataPage({Key? key}) : super(key: key);

  @override
  State<UbahPersonalDataPage> createState() => _UbahPersonalDataPageState();
}

class _UbahPersonalDataPageState extends State<UbahPersonalDataPage> {
  @override
  DateTime? tanggalLahirUpdate;
  String? selectedGenderUpdate,
      selectedPekerjaanUpdate,
      selectedStatusUpdate,
      selectedDomisiUpdate;

  String getText() {
    if (tanggalLahirUpdate == null) {
      return "Tanggal Lahir";
    } else {
      return "${tanggalLahirUpdate!.day}-${tanggalLahirUpdate!.month}-${tanggalLahirUpdate!.year}";
    }
  }

  bool inputCheck() {
    if (selectedGenderUpdate != null &&
        tanggalLahirUpdate != null &&
        selectedPekerjaanUpdate != null &&
        selectedStatusUpdate != null &&
        selectedDomisiUpdate != null) {
      return true;
    } else {
      return false;
    }
  }

  Future pickdate(BuildContext context) async {
    final hariSkrng = DateTime.now();
    final hariBaru = await showDatePicker(
        context: context,
        initialDate: tanggalLahirUpdate ?? hariSkrng,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (hariBaru == null) return;
    setState(() {
      tanggalLahirUpdate = hariBaru;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
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
                        "Ubah Personal Data",
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
                  height: 45,
                ),
                GestureDetector(
                  onTap: () {
                    pickdate(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      margin: const EdgeInsets.only(
                        bottom: 14,
                      ),
                      decoration: BoxDecoration(
                          color: cGreyYellow,
                          borderRadius: BorderRadius.circular(15)),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getText(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: cLightBlue,
                            ),
                          ),
                          Image.asset(
                            "assets/images/date_range.png",
                            height: 30,
                            width: 30,
                          )
                        ],
                      )),
                ),
                //++Gender++
                DropDownCustom(
                  kataHint: "Gender",
                  data: gender,
                  onStateChanged: (state) {
                    setState(() {
                      selectedGenderUpdate = state;
                    });
                  },
                ),

                //++Pekerjaan++
                DropDownCustom(
                  kataHint: "Pekerjaan kamu saat ini",
                  data: pekerjaan,
                  onStateChanged: (state) {
                    setState(() {
                      selectedPekerjaanUpdate = state;
                    });
                  },
                ),

                //++Status++
                DropDownCustom(
                  kataHint: "Status kamu saat in",
                  data: status,
                  onStateChanged: (state) {
                    setState(() {
                      selectedStatusUpdate = state;
                    });
                  },
                ),

                //++Domisi++
                DropDownCustom(
                  kataHint: "Domisili kamu saat ini",
                  data: domisi,
                  onStateChanged: (state) {
                    setState(() {
                      selectedDomisiUpdate = state;
                    });
                  },
                ),
              ],
            ),
          ),

          //Button Simpan
          TextButton(
            onPressed: inputCheck()
                ? () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                "Data telah disimpan",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: cDarkBlue,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Okay",
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: cLightBlue,
                                      )),
                                ),
                              ],
                            ));
                  }
                : null,
            style: TextButton.styleFrom(
              backgroundColor: inputCheck() ? cDarkYellow : cLightYellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.07),
            ),
            child: Text("SIMPAN",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700, fontSize: 14, color: cWhite)),
          ),
          const SizedBox(
            height: 10,
          ),
          //!===Main Children===
        ],
      )),
    );
  }
}
