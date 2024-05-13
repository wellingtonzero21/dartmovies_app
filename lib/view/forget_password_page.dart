import 'package:dart_movies_app/components/fil_field.dart';
import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
        appBar: const AppBarCustom(pageTitle: 'Recuperar Senha'),
        body: Container(
          margin: const EdgeInsets.only(top: 42),
          child: Column(
            children: [
              const Padding(padding: (EdgeInsets.only(right: 20, left: 20)),
            child: Text(
              'Insira seu e-mail para obter um código de verificação',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins-Regular',
                color: Colors.white,
              ),
            ),
              ),
            const SizedBox(height: 30),
            FilField(controller: emailController, text: 'Email'),
          ]),
        ));
  }
}
