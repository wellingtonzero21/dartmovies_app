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
    final String displayImageUrl = imageUrl.contains('facenull')
        ? 'https://avatars.githubusercontent.com/u/26902816?v=4' // Substitua pelo link do avatar desejado
        : imageUrl;
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(displayImageUrl),
            radius: 40,
          ),
          const SizedBox(height: 10),
          Text(
            nome,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
