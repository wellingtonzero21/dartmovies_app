import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LongCard extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final bool isWatchedMedia;
  final double progress;

  const LongCard({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.isWatchedMedia = false,
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
      child: Visibility(
        visible: isWatchedMedia,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/play-icon.svg',
              width: 70,
              height: 70,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 10,
                margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
