import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class MoviePage extends StatefulWidget {
  final String imageUrl;
  const MoviePage({
    super.key,
    required this.imageUrl,
  });

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Stack(
        children: [
          Image.network(
            widget.imageUrl,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/play-icon.svg',
                width: 70,
                height: 70,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      Positioned(
        left: 20,
        top: 20,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setOrientation();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF05F258),
            size: 35,
          ),
        ),
      )
    ]);
  }

  void setOrientation() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
