import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warunk_kopi/components/cofffee_tile.dart';
import 'package:warunk_kopi/models/coffee.dart';
import 'package:warunk_kopi/models/coffee_shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void RemoveFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
                child: Padding(
              padding: EdgeInsets.all(25.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Text(
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: value.userCart.length,
                            itemBuilder: (context, index) {
                              Coffee eachCoffee = value.userCart[index];
                              return CoffeeTile(
                                  coffee: eachCoffee,
                                  onPressed: () => RemoveFromCart(eachCoffee),
                                  icon: Icon(Icons.remove));
                            }))
                  ],
                ),
              ),
            )));
  }
}
