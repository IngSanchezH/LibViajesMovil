import 'package:comida/models/food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logourl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant(this.name, this.waitTime, this.distance, this.label, this.logourl,
      this.desc, this.score, this.menu);
}
