import 'package:flutter/material.dart';
import 'package:newsapp2/models/categoriy_data.dart';
import 'package:newsapp2/screens/tab_controller.dart';

import '../models/SourcesResponse.dart';
import '../shared/api_manger.dart';

class HomeScreen extends StatelessWidget {
  CategoryData categoryData;
  String? search;

  HomeScreen(this.categoryData, this.search);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: APIManger.getSources(categoryData.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("some thing is error");
        }
        if (snapshot.data?.status != 'ok') {
          return Text(snapshot.data!.message!);
        }
        var sources = snapshot.data?.sources ?? [];
        return DefultTabScreen(sources, search);
      },
    );
  }
}
