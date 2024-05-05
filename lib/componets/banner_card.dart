import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String url;
  const BannerCard({
    required this.url,
    super.key
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                url,
                width:MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Icon(
                color: Colors.grey[400], 
                size: 70, 
                Icons.play_circle_outlined),
          ),
        ],
        
      ),
    );
  }
}
