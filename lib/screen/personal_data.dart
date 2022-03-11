import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';
import 'package:kuisoner_app/widget/dropdown_custom.dart';

class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({Key? key}) : super(key: key);

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  DateTime? tanggalLahir;
  String? selectedGender, selectedPekerjaan, selectedStatus, selectedDomisi;

  String getText() {
    if (tanggalLahir == null) {
      return "Tanggal Lahir";
    } else {
      return "${tanggalLahir!.day}-${tanggalLahir!.month}-${tanggalLahir!.year}";
    }
  }

  bool inputCheck() {
    if (selectedGender != null &&
        tanggalLahir != null &&
        selectedPekerjaan != null &&
        selectedStatus != null &&
        selectedDomisi != null) {
      return true;
    } else {
      return false;
    }
  }

  Future pickdate(BuildContext context) async {
    final hariSkrng = DateTime.now();
    final hariBaru = await showDatePicker(
        context: context,
        initialDate: tanggalLahir ?? hariSkrng,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (hariBaru == null) return;
    setState(() {
      tanggalLahir = hariBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),

                //Header judul
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Personal Data",
                        style: GoogleFonts.poppins(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: cDarkBlue,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Personal data dipergunakan untuk menyesuaikan\nkriteria pengisi responden",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                //* ++KALENDER+++
                GestureDetector(
                  onTap: () {
                    pickdate(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      margin: const EdgeInsets.only(bottom: 14, top: 70),
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
                              color: cDarkBlue,
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
                      selectedGender = state;
                    });
                  },
                ),

                //++Pekerjaan++
                DropDownCustom(
                  kataHint: "Pekerjaan kamu saat ini",
                  data: pekerjaan,
                  onStateChanged: (state) {
                    setState(() {
                      selectedPekerjaan = state;
                    });
                  },
                ),

                //++Status++
                DropDownCustom(
                  kataHint: "Status kamu saat ini",
                  data: status,
                  onStateChanged: (state) {
                    setState(() {
                      selectedStatus = state;
                    });
                  },
                ),

                //++Domisi++
                DropDownCustom(
                  kataHint: "Domisili kamu saat ini",
                  data: domisi,
                  onStateChanged: (state) {
                    setState(() {
                      selectedDomisi = state;
                    });
                  },
                ),

                //! sub children
              ],
            )),
            TextButton(
              onPressed: inputCheck()
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CustomBottomNavBar()));
                    }
                  : null,
              style: TextButton.styleFrom(
                backgroundColor: inputCheck() ? cDarkYellow : cLightYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07),
              ),
              child: Text("BUAT AKUN",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: cWhite)),
            ),
            const SizedBox(
              height: 10,
            ),

            //! main children
          ],
        ),
      ),
    );
  }
}
