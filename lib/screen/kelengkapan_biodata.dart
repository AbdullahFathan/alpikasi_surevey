import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/screen/personal_data.dart';

class KelengkapanBiodata extends StatefulWidget {
  const KelengkapanBiodata({Key? key}) : super(key: key);

  @override
  _KelengkapanBiodataState createState() => _KelengkapanBiodataState();
}

class _KelengkapanBiodataState extends State<KelengkapanBiodata> {
  final _emailInputControler = TextEditingController();
  final _passInputControler = TextEditingController();
  final _namaInputControler = TextEditingController();
  bool isObscure = true;
  bool isContinue = false;

  @override
  void dispose() {
    _emailInputControler.dispose();
    _namaInputControler.dispose();
    _passInputControler.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_emailInputControler.text.isNotEmpty &&
        _passInputControler.text.isNotEmpty &&
        _namaInputControler.text.isNotEmpty) {
      setState(() {
        isContinue = true;
      });
    } else {
      setState(() {
        isContinue = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 55, top: 25),
                    child: Text(
                      "Belum Punya Akun? \nBuat Akun \nTerlebih Dahulu!",
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: cDarkBlue,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      // masukan email
                      Container(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        margin: const EdgeInsets.only(bottom: 14),
                        decoration: BoxDecoration(
                            color: cGreyYellow,
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                            controller: _emailInputControler,
                            decoration: InputDecoration(
                                hintText: "Masukkan email anda",
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: cLightBlue)),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => inputCheck()),
                      ),
                      // masukan Password
                      Container(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        decoration: BoxDecoration(
                            color: cGreyYellow,
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                            controller: _passInputControler,
                            decoration: InputDecoration(
                                hintText: "Masukkan kata sandi",
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: cLightBlue),
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() {
                                    isObscure = !isObscure;
                                  }),
                                  icon: Icon(isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                )),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            obscureText: isObscure,
                            onChanged: (value) => inputCheck()),
                      ),

                      // masukan nama pengguna
                      Container(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        margin: const EdgeInsets.only(bottom: 14, top: 14),
                        decoration: BoxDecoration(
                            color: cGreyYellow,
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                            controller: _namaInputControler,
                            decoration: InputDecoration(
                                hintText: "Masukkan nama pengguna",
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: cLightBlue)),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => inputCheck()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: isContinue
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PersonalDataScreen()));
                    }
                  : null,
              style: TextButton.styleFrom(
                backgroundColor: cDarkYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07),
              ),
              child: Text("ISI KELENGKAPAN BIODATA",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: cWhite)),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
