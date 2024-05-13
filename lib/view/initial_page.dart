import 'package:dart_movies_app/components/buttom.dart';
import 'package:dart_movies_app/view/create_account.dart';
import 'package:dart_movies_app/view/login_page.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.46,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://recreio.uol.com.br/media/uploads/marvel/aranhaverso_capa.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.4),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'DartM',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Black',
                    fontSize: 45,
                  ),
                ),
                Icon(Icons.play_circle, size: 36, color: Colors.white),
                Text(
                  'vies',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Black',
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Filmes, programas de TV e muito mais.',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Regular',
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 60),
            const ButtomCard(
              height: 55,
              width: 340,
              text: 'Entrar',
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountPage(),
                    ));
              },
              child: const Text(
                'Criar conta',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
