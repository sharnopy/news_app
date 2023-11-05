import 'package:flutter/material.dart';
import 'package:newsapp2/models/NewsData.dart';
import 'package:newsapp2/screens/detailes_screen.dart';
import 'package:newsapp2/screens/tab_icon.dart';
import 'package:newsapp2/shared/api_manger.dart';

import '../models/SourcesResponse.dart';
import 'news_card.dart';

class DefultTabScreen extends StatefulWidget {
  List<Sources> source;
  String? search;

  DefultTabScreen(this.source, this.search);

  @override
  State<DefultTabScreen> createState() => _DefultTabScreenState();
}

class _DefultTabScreenState extends State<DefultTabScreen> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.source.length,
            child: TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (value) {
                select = value;
                setState(() {});
              },
              tabs: widget.source
                  .map((e) => Tab(
                        child: TabItem(e, widget.source.indexOf(e) == select),
                      ))
                  .toList(),
            )),
        FutureBuilder<NewsDataModel>(
          future: APIManger.getNews(widget.source[select].id ?? "",
              search: widget.search),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("some thing has error");
            }
            if (snapshot.data?.status != 'ok') {
              return Text(snapshot.data?.message ?? "");
            }
            var news = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: news[index]);
                      },
                      child: NewsCard(news[index]));
                },
                itemCount: news.length,
              ),
            );
          },
        )
      ],
    );
  }
}
