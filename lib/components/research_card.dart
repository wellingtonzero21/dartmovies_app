import 'package:flutter/material.dart';

class ResearchCard extends StatelessWidget {
  // ignore: overridden_fields
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const ResearchCard({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
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
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white),
              cursorColor: Theme.of(context).colorScheme.secondary,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 88, 88, 88), fontSize: 17),
                hintText: 'Filmes, Séries...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
