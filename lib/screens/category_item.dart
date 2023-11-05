import 'package:flutter/material.dart';
import 'package:newsapp2/models/categoriy_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;

  CategoryItem(this.categoryData, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryData.color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft:
                  index.isEven ? Radius.circular(25) : Radius.circular(0),
              bottomRight:
                  index.isOdd ? Radius.circular(25) : Radius.circular(0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            categoryData.image,
            height: 110,
          ),
          Center(
              child: Text(
            categoryData.title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          )),
        ],
      ),
    );
  }
}
