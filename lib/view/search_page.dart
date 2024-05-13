import 'package:dart_movies_app/components/pesquisar_input.dart';
import 'package:dart_movies_app/model/media_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  //final MediaModel media;

  final List<MediaModel> mediaList;

  const SearchPage({super.key, required this.mediaList});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  List<MediaModel> midiaFiltrada = [];

  @override
  void initState() {
    super.initState();
    midiaFiltrada = widget.mediaList;
  }

  // Função de pesquisar
  void filtroPeloTitulo(String letra) {
    setState(() {
      midiaFiltrada = widget.mediaList
          .where((media) =>
              media.title.toLowerCase().contains(letra.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    alignment: Alignment.topLeft,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF05F258),
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PesquisarInput(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              onChanged: filtroPeloTitulo,
            ),
            midiaFiltrada.isEmpty
                ? const Center(
                    child: Text('Nenhum resultado encontrado'),
                  )
                : Container(
                    // ToDo: Grid do Wellington
                    ),
          ],
        ),
      ),
    );
  }
}
