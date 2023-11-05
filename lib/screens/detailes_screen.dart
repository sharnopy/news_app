import 'package:flutter/material.dart';
import 'package:newsapp2/models/NewsData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_card.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "detailsScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Articles;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0.0,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          centerTitle: true,
          title: Text(
            "News Title",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  args.urlToImage ?? "",
                  height: 230,
                  fit: BoxFit.fill,
                ),
              ),
              Text(args.title ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Text(
                      args.description ?? "",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {
                        Uri uli = Uri.parse(args.url ?? "");
                        launchUrl(uli);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "View Full Article",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 30,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
