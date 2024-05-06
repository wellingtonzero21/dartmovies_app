import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String imageUrl;
  final String nome;

  const ActorCard({
    super.key,
    required this.imageUrl,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 40,
          ),
          const SizedBox(height: 10),
          Text(
            nome,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
