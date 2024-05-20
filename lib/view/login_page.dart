import 'package:dart_movies_app/components/buttom.dart';
import 'package:dart_movies_app/components/fil_field.dart';
import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/view/forget_password_page.dart';
import 'package:dart_movies_app/view/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        appBar: const AppBarCustom(pageTitle: 'Entrar'),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 42),
            child: Column(
              children: [
                FillField(controller: emailController, text: 'Email'),
                const SizedBox(height: 20),
                FillField(
                    controller: passwordController,
                    text: "Password",
                    isObscured: true),
                const SizedBox(height: 45),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPasswordPage()),
                    );
                  },
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins-Bold',
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: GestureDetector(
                    child: const ButtomCard(
                      height: 55,
                      width: 340,
                      text: 'Entrar',
                    ),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
