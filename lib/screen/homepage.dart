import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuisoner_app/models/colors.dart';
import 'package:kuisoner_app/models/data_models.dart';
import 'package:kuisoner_app/screen/isi_kuisoner_page.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int activeIndexSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 220,
                    viewportFraction: 1,
                    pageSnapping: false,
                    onPageChanged: (index, reason) =>
                        setState(() => activeIndexSlider = index),
                  ),
                  itemCount: sliderData.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          image: DecorationImage(
                              image: AssetImage(
                                sliderData[index]["image"],
                              ),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
              ),
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: cDarkBlue,
                ),
                child: Positioned(
                    top: 25,
                    child: Row(
                      children: [
                        const SizedBox(width: 40),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: 240,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: cWhite,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: cLightBlue,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "cari Kuisoner",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: cLightBlue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/images/bell.png",
                          height: 27,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/images/filter.png",
                          height: 27,
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 27),
            height: 600,
            width: 300,
            child: ListView.builder(
                itemCount: homepageData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => IsiKuisonerPage(index: index)));
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            width: 330,
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: cDarkBlue,
                            ),
                          ),
                        ),
                        Positioned(
                            left: 50,
                            top: 10,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: DecorationImage(
                                    image: AssetImage(
                                      homepageData[index]["image"],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            )),
                        Positioned(
                            top: 10,
                            right: 58,
                            child: Container(
                              height: 127,
                              width: 130,
                              child: Text(
                                homepageData[index]["name"],
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: cWhite),
                                maxLines: 7,
                              ),
                            )),
                        Positioned(
                            bottom: -15,
                            right: 108,
                            child: Container(
                              height: 60,
                              width: 80,
                              child: Text(
                                homepageData[index]["poin"],
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: cDarkYellow),
                              ),
                            ))
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
