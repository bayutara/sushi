import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    //salmon sushi
    Food(
      name: "salmon sushi",
      price: "2.10",
      imagePath: "lib/images/salmon_sushi.png",
      rating: "4,9",
    ),
    //tuna
    Food(
      name: "tuna",
      price: "2.30",
      imagePath: "lib/images/tuna.png",
      rating: "4,3",
    ),
    //
  ];

  //customer cart
  List<Food> _cart = [];

  //getter method
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
