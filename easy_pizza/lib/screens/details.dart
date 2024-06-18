import 'package:easy_pizza/cart_provider.dart';
import 'package:easy_pizza/models/pizza_cart.dart';
import 'package:flutter/material.dart';
import 'package:easy_pizza/models/pizza.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class PizzaDetails extends StatelessWidget {
  final Pizza pizza;

  const PizzaDetails ({
    super.key,
    required this.pizza
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                child: Image.asset('images/logo.png', height: 50, width: 50),
              ),
              Text(
                pizza.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold,
                  ),
              ),
          ],) 
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                child: Image.asset('images/pizza.png', height: 150, width: 150,),
              ),
              Text(
                pizza.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.red,
                ),
              ),
              Text(
                "${pizza.price.toStringAsFixed(2)}€",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                child :Consumer<CartProvider>(
                  builder: (context, cart, child) {
                    return ElevatedButton(
                      onPressed: () => {cart.addPizza(PizzaCart(pizza: pizza, quantity: 1))},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ), 
                      child: const Icon(Icons.add_rounded),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                child : Text(
                  "Ingrédients :",
                  style: TextStyle(
                    fontSize: 14,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Column(
                  children: pizza.ingredients.map((ingredient) {
                    return ListTile(
                      title: Text(
                        ingredient,
                        style: const TextStyle(
                          fontSize: 12
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {context.go('/');},
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}