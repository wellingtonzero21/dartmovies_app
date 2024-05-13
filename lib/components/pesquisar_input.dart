import 'package:flutter/material.dart';

class PesquisarInput extends StatelessWidget {
  // ignore: overridden_fields
  final TextEditingController? controller;

  const PesquisarInput({
    super.key,
    this.controller,
    this.style,
    required void Function(dynamic query) onChanged,
  });

  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.transparent),
      ),
      child: TextField(
        controller: controller,
        style: style,
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '',
          contentPadding: EdgeInsets.symmetric(horizontal: 25),
        ),
      ),
    );
  }
}
