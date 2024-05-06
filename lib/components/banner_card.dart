import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerCard extends StatelessWidget {
  final String url;
  const BannerCard({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  url,
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height * 0.25,
                  // fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/play-icon.svg',
              width: 70,
              height: 70,
            ),
            // Icon(color: Colors.grey[400], size: 70, Icons.play_circle_outlined),
          ],
        ),
      ],
    );
  }
}
