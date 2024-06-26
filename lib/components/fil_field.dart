import 'package:flutter/material.dart';

class FillField extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  final bool isObscured;

  const FillField({
    super.key,
    this.controller,
    this.text,
    this.isObscured = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                cursorColor: Theme.of(context).colorScheme.secondary,
                obscureText: isObscured,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
                  labelText: text,
                  labelStyle: const TextStyle(color: Color(0xFF656565)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
