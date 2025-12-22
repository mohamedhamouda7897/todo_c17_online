import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  static const String routeName = "IntroScreen";

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset("assets/images/evently_logo.png"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 28,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/creative.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              "onboardingTitle".tr(),
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              "onboardingSubTitle".tr(),
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Row(
                    spacing: 18,
                    children: [
                      InkWell(
                        onTap: () {
                          context.setLocale(Locale("en", "US"));
                        },
                        child: Container(
                          padding: context.locale == Locale("en", "US")
                              ? null
                              : EdgeInsets.symmetric(horizontal: 4),
                          decoration: context.locale == Locale("en", "US")
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 4,
                                  ),
                                )
                              : null,
                          child: Image.asset(
                            "assets/images/Group.png",
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.setLocale(Locale("ar", "EG"));
                        },
                        child: Container(
                          decoration: context.locale == Locale("ar", "EG")
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 4,
                                  ),
                                )
                              : null,

                          padding: context.locale == Locale("ar", "EG")
                              ? null
                              : EdgeInsets.symmetric(horizontal: 4),
                          child: Image.asset(
                            "assets/images/EG.png",
                            fit: BoxFit.cover,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "theme".tr(),
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: Row(
                    spacing: 18,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                          border: Border.all(color: Colors.blue, width: 4),
                        ),
                        child: Image.asset(
                          "assets/images/Sun.png",
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Image.asset(
                          "assets/images/Moon.png",
                          fit: BoxFit.cover,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "letsStart".tr(),
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
