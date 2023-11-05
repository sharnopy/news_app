import 'package:flutter/material.dart';
import 'package:newsapp2/models/SourcesResponse.dart';
import 'package:newsapp2/models/categoriy_data.dart';
import 'package:newsapp2/screens/home_screen.dart';
import 'package:newsapp2/shared/api_manger.dart';

import '../screens/categories_screen.dart';
import '../screens/drawer.dart';
import '../screens/tab_controller.dart';

class HomeLayOut extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  bool search = false;
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: !search
            ? AppBar(
                backgroundColor: Colors.green,
                elevation: 0.0,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                title: Text(
                  "News APP",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        search = !search;
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ))
                ],
              )
            : AppBar(
                title: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: myController,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      prefixIconColor: Colors.green,
                      suffixIconColor: Colors.green,
                      focusColor: Colors.green,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                      hintText: "search",
                      prefixIcon: IconButton(
                        onPressed: () {
                          myController.clear();
                          search = !search;
                          setState(() {});
                        },
                        icon: Icon(Icons.close),
                      ),
                      suffixIcon: Icon(Icons.search)),
                ),
                backgroundColor: Colors.green,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
              ),
        drawer: drawer(onDrawerSelecsted),
        body: categoryData == null
            ? CategoriesScreen(onCategorySeleced)
            : HomeScreen(categoryData!, myController.text),
      ),
    ));
  }

  CategoryData? categoryData = null;

  void onDrawerSelecsted(number) {
    if (number == drawer.categore) {
      categoryData = null;
      Navigator.pop(context);
    } else if (number == drawer.settings) {}
    setState(() {});
  }

  void onCategorySeleced(categorySeleceted) {
    categoryData = categorySeleceted;
    setState(() {});
  }
}

// HomeScreen(),
