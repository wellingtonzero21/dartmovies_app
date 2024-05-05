import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.network(
                  'https://rollingstone.uol.com.br/media/uploads/luca-divulgacao-disney_1.jpg',
                  height: MediaQuery.of(context).size.height * 0.48,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Center(
                    child: IconButton(
                  icon: const Icon(
                    Icons.play_circle_outline,
                    size: 60,
                  ),
                  onPressed: () {},
                )),
                Positioned(
                  left: 20,
                  top: 60,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF05F258),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Luca',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white),
                            ),
                            Text(
                              'Animação | 1h 57m | 2021',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Color(0xFFB5B5B5)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Text(
                        'Lorem ipsum dolor sit amet consectetur. Ultrices quis quam sit amet. Id duis affgorae dignissim non suspendisse nulla leo.Lorem ipsum dolor sit amet consectetur. Ultrices quis quam sit amet. Id duis affgorae dignissim non suspendisse nulla leo.Lorem ipsum dolor sit amet consectetur. Ultrices quis quam sit amet. Id duis affgorae dignissim non suspendisse nulla leo.Lorem ipsum dolor sit amet consectetur. Ultrices quis quam sit amet. Id duis affgorae dignissim non suspendisse nulla leo.',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins-Regular',
                            color: Colors.white),
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Text('Classificação: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Text(
                            '12 anos.',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins-Regular',
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Diretor: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Enrico Casarosa.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Roteiro: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Mike Jones e Jesse Andrews.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Produtoras: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Pixar, Walt Disney Pictures',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Recomendados',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-SemiBold',
                            color: Colors.white),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
