import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/models/NewsData.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(25),
      //
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
            imageUrl: articles.urlToImage ?? "",
            height: 180,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          // Image.network(articles.urlToImage??"",
          // height: 180,
          // fit: BoxFit.fill,),
          Text(
            articles.author ?? "",
            style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
          ),
          Text(articles.title ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Text(
            articles.publishedAt?.substring(0, 10) ?? "",
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
