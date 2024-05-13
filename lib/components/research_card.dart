import 'package:flutter/material.dart';

class ResearchCard extends StatelessWidget {
  // ignore: overridden_fields
  final TextEditingController? controller;

  const ResearchCard({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.search,
              color: Color(0xFF05F258),
              size: 30,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              cursorColor: Theme.of(context).colorScheme.secondary,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 88, 88, 88), fontSize: 18),
                hintText: 'Filmes, Séries...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
