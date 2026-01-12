import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_c17_online/core/extensions.dart';
import 'package:todo_c17_online/providers/theme_provider.dart';

class IntroScreen extends StatefulWidget {
  static const String routeName = "IntroScreen";

  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Image.asset("assets/images/evently_logo.png")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 28,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              context.brightness() == Brightness.light
                  ? "assets/images/creative.png"
                  : "assets/images/dark-creative.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text("onboardingTitle".tr(), style: context.bodyLarge()),
            Text("onboardingSubTitle".tr(), style: context.displayMedium()),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "language".tr(),
                  style: context.theme().textTheme.displaySmall,
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
                                    color: context.theme().colorScheme.primary,
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
                                    color: context.theme().colorScheme.primary,
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
                Text("theme".tr(), style: context.displaySmall()),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: context.theme().colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    spacing: 18,
                    children: [
                      GestureDetector(
                        onTap: () {
                          provider.changeTheme(ThemeMode.light);
                        },
                        child: Container(
                          padding: provider.themeMode == ThemeMode.light
                              ? null
                              : EdgeInsets.symmetric(horizontal: 4),
                          decoration: provider.themeMode == ThemeMode.light
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: context.theme().colorScheme.primary,
                                  border: Border.all(
                                    color: context.theme().colorScheme.primary,
                                    width: 4,
                                  ),
                                )
                              : null,
                          child: ImageIcon(
                            AssetImage("assets/images/Sun.png"),
                            size: 35,
                            color: provider.themeMode == ThemeMode.light
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          provider.changeTheme(ThemeMode.dark);
                        },
                        child: Container(
                          padding: provider.themeMode == ThemeMode.dark
                              ? null
                              : EdgeInsets.symmetric(horizontal: 4),

                          decoration: provider.themeMode == ThemeMode.dark
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: context.theme().colorScheme.primary,
                                  border: Border.all(
                                    color: context.theme().colorScheme.primary,
                                    width: 4,
                                  ),
                                )
                              : null,
                          child: ImageIcon(
                            AssetImage("assets/images/Moon.png"),
                            size: 35,
                            color: provider.themeMode == ThemeMode.dark
                                ? Theme.of(context).colorScheme.onSecondary
                                : Theme.of(context).colorScheme.primary,
                          ),
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
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),

                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "letsStart".tr(),
                    style: Theme.of(context).textTheme.displayLarge,
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
