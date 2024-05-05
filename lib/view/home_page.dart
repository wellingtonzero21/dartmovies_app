import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.only(
              top: 38,
              left: 20,
              right: 20,
              bottom: 6,
            ),
            dividerColor: Theme.of(context).colorScheme.background,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.4),
            labelStyle: const TextStyle(
              fontFamily: 'Poppins-Bold',
              fontSize: 17,
            ),
            tabs: const [
              Tab(text: 'Início'),
              Tab(text: 'Filmes'),
              Tab(text: 'Séries'),
            ],
          ),
        ),
        body: const Column(
          children: [
            Center(child: Text('Hello, Well =)')),
            //Aqui vai ficar o o Componente "banner" - Nome do arquivo sugerido a ser criado no "components" é banner_card.dart

            //Aqui vai ficar o Componente "Continue assistindo" - Nome do arquivo sugerido a ser criado no "components" - long_play_card.dart

            //Aqui vai ficar o Componente "Em Alta" - Nome do arquivo sugerido a ser criado no "components" - small_card.dart

            //Aqui vai ficar o Componente "Recomendados" - Nome do arquivo sugerido a ser criado no "components" - long_card.dart

            //Aqui vai ficar o Componente "Atores Populares"- Nome do arquivo sugerido a ser criado no "components" - actors_card.dart
          ],
        ),
      ),
    );
  }
}
