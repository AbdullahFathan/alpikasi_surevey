import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';
import 'package:kuisoner_app/screen/berhasil_isi_kuisoner.dart';
import 'package:kuisoner_app/screen/gform_webview.dart';

class IsiKuisonerPage extends StatefulWidget {
  int index;
  IsiKuisonerPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<IsiKuisonerPage> createState() => _IsiKuisonerPageState();
}

class _IsiKuisonerPageState extends State<IsiKuisonerPage> {
  bool isHasCheck = false;
  String url =
      "https://docs.google.com/forms/d/e/1FAIpQLSez6KBg99-khptrq_tJQppz1bDc0rxRZ-JB5AXohIKXyFNmSg/viewform";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    color: cDarkBlue,
                  ),
                  child: Image.asset(
                    homepageData[widget.index]["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 15,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: cWhite,
                        size: 32,
                      ),
                    )),
                Positioned(
                    bottom: -14,
                    left: 45,
                    child: Container(
                      padding: const EdgeInsets.only(left: 8),
                      width: 300,
                      height: 110,
                      child: Text(
                        homepageData[widget.index]["name"],
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: cWhite),
                        maxLines: 3,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            //==={Kriteria Respoden}====
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kriteria Responden",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: cDarkBlue,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Usia",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cLightBlue),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/yess.png",
                            height: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "20-30",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: cDarkBlue),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gender",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cLightBlue),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/yess.png",
                            height: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Laki-Laki",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: cDarkBlue),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pekerjaan",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cLightBlue),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/yess.png",
                            height: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Mahasiswa",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: cDarkBlue),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Domisili",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cLightBlue),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/yess.png",
                            height: 18,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Jawa barat",
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: cDarkBlue),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 17),
                  //==={Persyaratan Tambahan}===
                  Text(
                    "Persyaratan Tambahan",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: cDarkBlue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Diutamakan mahasiwa it\nSering menggunakan aplikasi gojek dan berbagai fiturnya",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: cLightBlue),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Poin yang didapat",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cDarkBlue),
                      ),
                      Text(
                        "45 Poin",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cDarkBlue),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 45),
            CheckboxListTile(
                title: Text(
                  "Saya menyetujui persyaratan dan kriteria",
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: cDarkBlue),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                value: isHasCheck,
                onChanged: (value) {
                  setState(() {
                    isHasCheck = value!;
                    print("isHasChech =  $isHasCheck");
                  });
                }),

            Container(
              height: 70,
              width: 320,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 25, left: 25),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => GformWebView(
                                urlGfrom: url,
                              )));
                },
                style: TextButton.styleFrom(
                  backgroundColor: cDarkYellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("ISI KUISONER",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: cWhite)),
              ),
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
