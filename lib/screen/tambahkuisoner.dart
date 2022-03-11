import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';
import 'package:kuisoner_app/screen/payment_succes_page.dart';

import '../widget/dropdown_custom.dart';

class TambahKuisonerScreen extends StatefulWidget {
  const TambahKuisonerScreen({Key? key}) : super(key: key);

  @override
  State<TambahKuisonerScreen> createState() => _TambahKuisonerScreenState();
}

class _TambahKuisonerScreenState extends State<TambahKuisonerScreen> {
  final _linkTextControler = TextEditingController();
  final _usiaMinimalTextContoler = TextEditingController();
  final _usiaMaxTextControler = TextEditingController();
  final _opsionalTextCotroler = TextEditingController();
  String? selectedGender,
      selectedPekerjaan,
      selectedStatus,
      selectedDomisi,
      selectedPaket,
      selectedPembayaran;

  @override
  void dispose() {
    _linkTextControler.dispose();
    _usiaMaxTextControler.dispose();
    _usiaMinimalTextContoler.dispose();
    _opsionalTextCotroler.dispose();
    super.dispose();
  }

  bool inputCheck() {
    if (selectedPaket == "Gratis") {
      if (_linkTextControler.text.isNotEmpty &&
          _usiaMaxTextControler.text.isNotEmpty &&
          _usiaMinimalTextContoler.text.isNotEmpty &&
          selectedGender != null &&
          selectedPekerjaan != null &&
          selectedStatus != null &&
          selectedDomisi != null &&
          selectedPaket != null) {
        return true;
      } else {
        return false;
      }
    } else {
      if (_linkTextControler.text.isNotEmpty &&
          _usiaMaxTextControler.text.isNotEmpty &&
          _usiaMinimalTextContoler.text.isNotEmpty &&
          selectedGender != null &&
          selectedPekerjaan != null &&
          selectedStatus != null &&
          selectedDomisi != null &&
          selectedPaket != null &&
          selectedPembayaran != null) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 30),
          //*++++ SECTION LINK KUISONER+++
          Container(
            margin: const EdgeInsets.only(left: 25),
            height: 95,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Link Kuesioner",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      color: cGreyYellow,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: cDarkBlue),
                    controller: _linkTextControler,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Tambahkan link kuesioner kamu",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: cLightBlue),
                    ),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ],
            ),
          ),
          //*++++++SECTION KRITERIA +++++++
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 500,
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kriteria",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    )),
                const SizedBox(
                  height: 10,
                ),

                //usia mininal
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: cGreyYellow,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: cDarkBlue),
                    controller: _usiaMinimalTextContoler,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Usia Minimal",
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: cLightBlue),
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),

                //Usia maxsimal
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: cGreyYellow,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: cDarkBlue),
                    controller: _usiaMaxTextControler,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Usia Maksimal",
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue)),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
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
                  kataHint: "Pekerjaan",
                  data: pekerjaan,
                  onStateChanged: (state) {
                    setState(() {
                      selectedPekerjaan = state;
                    });
                  },
                ),

                //++Status++
                DropDownCustom(
                  kataHint: "Status",
                  data: status,
                  onStateChanged: (state) {
                    setState(() {
                      selectedStatus = state;
                    });
                  },
                ),

                //++Domisi++
                DropDownCustom(
                  kataHint: "Domisili",
                  data: domisi,
                  onStateChanged: (state) {
                    setState(() {
                      selectedDomisi = state;
                    });
                  },
                ),

                //!sub childreen kriteria
              ],
            ),
          ),

          //+++Persyaratan tambahan section++++
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 150,
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Persyaratan Tambahan",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: cDarkBlue,
                        )),
                    Text(
                      " (Opsional)",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cDarkBlue,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: cGreyYellow,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: cDarkBlue),
                    controller: _opsionalTextCotroler,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            "Tambahkan persyaratan lain yang ingin\ndisesuaikan oleh responden",
                        hintMaxLines: 2,
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: cLightBlue)),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                )
              ],
            ),
          ),
          //++++ UPLOAD GAMBAR SECTION++++
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 90,
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Upload Gambar",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: cDarkBlue,
                        )),
                    Text(
                      " (Opsional)",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cDarkBlue,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    padding: const EdgeInsets.only(right: 8, left: 8),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: cGreyYellow,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Pilih Gambar",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: cLightBlue),
                        ),
                        Image.asset(
                          "assets/images/photo_camera.png",
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //++Paket Sebar Kuisoner
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 120,
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Paket Sebar Kuisoner",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    )),
                const SizedBox(
                  height: 10,
                ),
                DropDownCustom(
                  kataHint: "Pilih paket sebar kuesioner",
                  data: paket,
                  onStateChanged: (state) {
                    setState(() {
                      selectedPaket = state;
                    });
                  },
                ),
              ],
            ),
          ),

          //++++++TEXT SECTION++++++
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 120,
            margin: const EdgeInsets.only(left: 25, top: 13, right: 25),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea.",
              maxLines: 5,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500, color: cLightBlue),
            ),
          ),

          //+++MENU PEMBAYARAN SECTION+++++
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 120,
            margin: const EdgeInsets.only(left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Metode Pembayaran",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: selectedPaket == "Gratis"
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.only(right: 8, left: 8),
                            margin: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            decoration: BoxDecoration(
                                color: cGreyYellow,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Paket Gratis Tidak Perlu Pembayaran",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: cLightBlue,
                                ),
                              ),
                            ),
                          )
                        : DropDownCustom(
                            kataHint: "Pilih metode pembayaran",
                            data: pembayaran,
                            onStateChanged: (state) {
                              setState(() {
                                selectedPembayaran = state;
                              });
                            },
                          )),
              ],
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: TextButton(
              onPressed: inputCheck()
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PaymentSuccesPage()));
                    }
                  : null,
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: inputCheck() ? cDarkYellow : cLightYellow,
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.07),
              ),
              child: Text("SEBARKAN KUISONER",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: cWhite)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          //!====MAIN CHILDREEN====
        ],
      ),
    );
  }
}
