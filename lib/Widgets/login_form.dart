import 'package:animated_login/Widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 55, right: 55, bottom: 100),
      child: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppTextField(
              hintText: "Email",
              obsecureText: false,
            ),
            const Spacer(),
            const AppTextField(
              hintText: "Password",
              obsecureText: true,
            ),
            const Spacer(),
            Container(
              height: 55,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF2DD4BD), Color(0xFF7BC1F2)],
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55),
      child: SizedBox(
        height: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppTextField2(hintText: "Full Name"),
            const Spacer(),
            const AppTextField2(hintText: "Email"),
            const Spacer(),
            const AppTextField2(
              hintText: "Password",
              obsecureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Color(0xFF2DD4BD),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
