import 'package:flutter/material.dart';

class ResearchCard extends StatelessWidget {
  // ignore: overridden_fields
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextStyle? style;

  const ResearchCard({
    super.key,
    this.controller,
    this.onChanged,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25.0, right: 25.0),
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(27),
        border: Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Icon(
              Icons.search,
              color: Color(0xFF05F258),
              size: 33,
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              style: style,
              cursorColor: Colors.white,
              onChanged: onChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '',
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
