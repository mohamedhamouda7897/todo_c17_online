import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c17_online/core/my_theme_data.dart';
import 'package:todo_c17_online/providers/theme_provider.dart';
import 'package:todo_c17_online/screens/add_event/add_event_screen.dart';
import 'package:todo_c17_online/screens/auth/login_screen.dart';
import 'package:todo_c17_online/screens/auth/register_screen.dart';
import 'package:todo_c17_online/screens/auth/reset_password_screen.dart';
import 'package:todo_c17_online/screens/home/home_screen.dart';
import 'package:todo_c17_online/screens/intro_Screen/intro_screen.dart';

import 'firebase_options.dart';

// extension StringToInt on String {
//   int toIntOrZero() {
//     return int.tryParse(this) ?? 0;
//   }
// }

void main() async {
  // String number = "123";
  // int n=number.toIntOrZero();
  //
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseFirestore.instance.enableNetwork();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        IntroScreen.routeName: (c) => IntroScreen(),
        LoginScreen.routeName: (c) => const LoginScreen(),
        RegisterScreen.routeName: (c) => const RegisterScreen(),
        HomeScreen.routeName: (c) => HomeScreen(),
        ResetPasswordScreen.routeName: (c) => const ResetPasswordScreen(),
        AddEventScreen.routeName: (c) => AddEventScreen(),
      },
    );
  }
}
