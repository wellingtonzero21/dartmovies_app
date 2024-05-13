import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/components/research_card.dart';
import 'package:dart_movies_app/components/small_card.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import '../model/media_model.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();

  SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late List<MediaModel> filteredMediaList;

  @override
  void initState() {
    super.initState();
    filteredMediaList = listTrendings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(pageTitle: ''),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ResearchCard(
                    controller: widget.controller,
                    onChanged: (String value) {
                      setState(() {
                        filteredMediaList = listTrendings
                            .where((media) => media.title
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 35 / 50,
                      ),
                      itemCount: filteredMediaList.length,
                      itemBuilder: (context, index) {
                        MediaModel trendingMedia = filteredMediaList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        media: trendingMedia,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SmallCard(
                              imageUrl: trendingMedia.urlSmallBanner,
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
