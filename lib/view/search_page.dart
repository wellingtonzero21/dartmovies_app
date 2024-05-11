import 'package:dart_movies_app/components/small_card.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import '../model/media_model.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();

  SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<MediaModel> filteredMediaList;

  @override
  void initState() {
    super.initState();
    filteredMediaList = listTrendings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 13,
              top: 60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  alignment: Alignment.topLeft,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF05F258),
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
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
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: SmallCard(
                            imageUrl: trendingMedia.urlSmallBanner,
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
