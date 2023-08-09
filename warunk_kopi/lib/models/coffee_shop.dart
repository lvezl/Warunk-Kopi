import 'package:flutter/material.dart';
import 'package:warunk_kopi/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  final List<Coffee> _shop = [
    Coffee(name: 'Long Black', price: "5", imagePath: "lib/images/Black.png"),
    Coffee(name: 'Latte', price: "7", imagePath: "lib/images/Latte.png"),
    Coffee(name: 'Cold Snow', price: "5", imagePath: "lib/images/Iced.png"),
    Coffee(
        name: 'Latin Black', price: "5", imagePath: "lib/images/Americano.png"),
  ];

  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _shop;

  List<Coffee> get userCart => _userCart;

  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
