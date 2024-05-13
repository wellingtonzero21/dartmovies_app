import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SeriesPage extends StatefulWidget {
  final String imageUrl;
  const SeriesPage({
    super.key,
    required this.imageUrl,
  });

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.network(
        widget.imageUrl,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
