import 'dart:ui';

class CategoryData {
  String id;
  String image;
  String title;
  Color color;

  CategoryData(this.id, this.image, this.title, this.color);

  static List<CategoryData> getCategory() {
    return [
      CategoryData(
          "sports", "assets/images/sports.png", "Sports", Color(0XFFC91C22)),
      CategoryData(
          "health", "assets/images/health.png", "Health", Color(0XFFED1E79)),
      CategoryData("business", "assets/images/bussines.png", "business",
          Color(0XFFCF7E48)),
      CategoryData(
          "science", "assets/images/science.png", "science", Color(0XFFF2D352)),
    ];
  }
}
