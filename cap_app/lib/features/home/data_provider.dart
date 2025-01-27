import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  // String text = "Some data";
  final List<Product> cartList = [];

  void addProduct({required Product newProduct, required bool isAdd}) {
    final List cartNames = [];

    for (var element in cartList) {
      cartNames.add(element.name);
    }

    if (cartNames.contains(newProduct.name)) {
      final index = cartNames.indexOf(newProduct.name);

      if (cartList[index].count == 1 && !isAdd) {
        cartList.remove(cartList[index]);
        notifyListeners();
      } else {
        cartList[index] = Product(
            name: cartList[index].name,
            image: cartList[index].image,
            price: cartList[index].price,
            count: cartList[index].count + (isAdd ? 1 : (-1)));
      }
    } else {
      cartList.add(newProduct);
    }
  }
}

class Product {
  final String name;
  final String image;
  final double price;
  final int count;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.count = 1,
  });
}
