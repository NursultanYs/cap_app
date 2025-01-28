import 'package:cap_app/features/home/models/cars_data.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Car> favoriteList = [];

  void changeFavorite({required Car newFavorite}) {
    if (favoriteList.contains(newFavorite)) {
      favoriteList.remove(newFavorite);
    } else {
      favoriteList.add(newFavorite);
    }
    notifyListeners();
  }
}
