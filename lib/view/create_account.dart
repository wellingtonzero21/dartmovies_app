import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/components/buttom.dart';
import 'package:dart_movies_app/view/terms_of_use.dart';
import 'package:flutter/material.dart';

import '../components/fill_field_card.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(pageTitle: 'Criar conta'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FillField(text: 'Nome completo', height: 55, width: 340),
            const SizedBox(height: 25),
            const FillField(text: 'Email', height: 55, width: 340),
            const SizedBox(height: 25),
            const FillField(text: 'Digite sua senha', height: 55, width: 340),
            const SizedBox(height: 25),
            const FillField(text: 'Confirmar senha', height: 55, width: 340),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Container(
                        width: 11,
                        height: 11,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const Text('Concordo com os '),
                GestureDetector(
                  child: Text(
                    'Termos de Uso.',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TermsOfUsePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            const ButtomCard(
              height: 55,
              width: 340,
              text: 'Cadastrar-se',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                'Entre com:',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                  decorationColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/vetores-premium/icone-do-logotipo-do-google-definir-o-icone-do-google-vector-de-icones-de-pesquisa_981536-453.jpg'),
                  radius: 28,
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.icon-icons.com/icons2/2429/PNG/512/apple_logo_icon_147318.png'),
                  radius: 28,
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
