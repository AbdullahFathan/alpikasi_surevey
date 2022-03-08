import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({Key? key}) : super(key: key);

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
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
                        "Ubah Informasi Akun",
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

                //*===={Informasi Akun user}=====
                Center(
                  child: Column(
                    children: [
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
                ),
              ],
            )),

            //Button
            TextButton(
              onPressed: isContinue
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
                backgroundColor: isContinue ? cDarkYellow : cLightYellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07),
              ),
              child: Text("SIMPAN",
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
      ),
    );
  }
}
