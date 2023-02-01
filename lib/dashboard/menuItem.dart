
import 'package:flutter/cupertino.dart';

class DrawerItem{
  String name;
  IconData icon;
  DrawerItem(this.name, this.icon);
}

class GridItem{
  String name;
 String imagePath;
  GridItem(this.name,this.imagePath);
}

  class HomeItem{
  String name;
  String count;
  String imagePath;
  Color bColor;
  HomeItem(this.count,this.name,this.imagePath,this.bColor);
}
