import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/screen/kelengkapan_biodata.dart';
import 'package:kuisoner_app/widget/bottomnavbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameInputControler = TextEditingController();
  final _passwordInputController = TextEditingController();
  bool isObscure = true;
  bool isContinue = false;

  @override
  void dispose() {
    _usernameInputControler.dispose();
    _passwordInputController.dispose();
    super.dispose();
  }

  inputCheck() {
    if (_passwordInputController.text.isNotEmpty &&
        _usernameInputControler.text.isNotEmpty) {
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 35, bottom: 45),
                  height: MediaQuery.of(context).size.width * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset("assets/images/gambar_depan.png"),
                ),

                //* ===Username & password ====
                Container(
                  //===Email==
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  margin: const EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                      color: cGreyYellow,
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _usernameInputControler,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: cDarkBlue),
                    decoration: InputDecoration(
                        hintText: "Nama Pengguna atau Email",
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => inputCheck(),
                  ),
                ),
                //Password
                Container(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  decoration: BoxDecoration(
                      color: cGreyYellow,
                      borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                      controller: _passwordInputController,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: cDarkBlue),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: cLightBlue),
                          suffixIcon: IconButton(
                            color: cLightBlue,
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

                //*===tombol masuk===
                GestureDetector(
                  onTap: isContinue
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CustomBottomNavBar()));
                        }
                      : null,
                  child: Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                          color: isContinue ? cDarkYellow : cLightYellow,
                          borderRadius: BorderRadius.circular(15)),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                        child: Text("Masuk",
                            style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: cWhite)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 20),
                  child: Text("Lupa Kata Sandi?",
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: cDarkBlue)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Vector 9.png",
                      width: 125,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Atau",
                      style: GoogleFonts.raleway(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: cLightBlue),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      "assets/images/Vector 9.png",
                      width: 125,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    "assets/images/Group 147.png",
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => KelengkapanBiodata()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Tidak punya Akun? ",
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff979797),
                          ),
                        ),
                        Text(
                          "Buat Akun",
                          style: GoogleFonts.raleway(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: cDarkBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //! ====CHildreen main =====
              ],
            ),
          ),
        ),
      ),
    );
  }
}
