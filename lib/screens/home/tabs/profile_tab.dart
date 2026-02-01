import 'package:flutter/material.dart';
import 'package:todo_c17_online/screens/auth/login_screen.dart';

import '../../../core/firebase_functions.dart' show FirebaseFunctions;

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseFunctions.signOut();
        Navigator.pushNamedAndRemoveUntil(
          context,
          LoginScreen.routeName,
          (route) => false,
        );
      },

      child: Center(child: Text("Sign Out")),
    );
  }
}
