import 'package:flutter/material.dart';

class ButtomCard extends StatelessWidget {
  final double? width;
  final String text;
  final double? height;

  const ButtomCard({
    super.key,
    required this.width,
    required this.height,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontFamily: 'Poppins-Bold', fontSize: 18),
        )),
      ),
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
      },
    );
  }
}
