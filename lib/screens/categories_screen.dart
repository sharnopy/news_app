import 'package:flutter/material.dart';
import 'package:newsapp2/models/categoriy_data.dart';
import 'package:newsapp2/screens/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySeleced;

  CategoriesScreen(this.onCategorySeleced);

  @override
  Widget build(BuildContext context) {
    var category = CategoryData.getCategory();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Pick Your Category Of Interest",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: category.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategorySeleced(category[index]);
                    },
                    child: CategoryItem(category[index], index));
              },
            ),
          )
        ],
      ),
    );
  }
}
