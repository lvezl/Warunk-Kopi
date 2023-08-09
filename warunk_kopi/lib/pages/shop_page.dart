import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warunk_kopi/components/cofffee_tile.dart';
import 'package:warunk_kopi/models/coffee.dart';
import 'package:warunk_kopi/models/coffee_shop.dart';
import 'package:warunk_kopi/pages/cart_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _CartPageState();
}

class _CartPageState extends State<ShopPage> {
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Successfully Added"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                "How Would You Like Your Coffee?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index) {
                        Coffee eachCoffee = value.coffeeShop[index];

                        return CoffeeTile(
                          coffee: eachCoffee,
                          icon: Icon(Icons.add),
                          onPressed: () => addToCart(eachCoffee),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
