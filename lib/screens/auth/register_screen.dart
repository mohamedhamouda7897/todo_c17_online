import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_c17_online/core/extensions.dart';
import 'package:todo_c17_online/screens/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Image.asset("assets/images/evently_logo.png", height: 70),
              const SizedBox(height: 40),
              Text(
                "Create your account",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: context.theme().colorScheme.primary,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: ImageIcon(
                    AssetImage("assets/images/user.png"),
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter your email",
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Image.asset("assets/images/email_ic.png"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  filled: true,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  prefixIcon: Image.asset("assets/images/lock_ic.png"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,

                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: !isConfirmPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Confirm your password",
                  filled: true,
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  prefixIcon: Image.asset("assets/images/lock_ic.png"),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: context.theme().colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Center(child: Text("Or")),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset("assets/images/google.png", height: 24),
                label: const Text("Sign up with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
