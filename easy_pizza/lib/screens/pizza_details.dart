import 'package:flutter/material.dart';
import 'package:easy_pizza/models/pizza.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';


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
                child: Image.asset('images/pizza.png'),
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                child : Text(
                  "Ingrédients :",
                  style: TextStyle(
                    fontSize: 18,
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                child: Column(
                  children: pizza.ingredients.map((ingredient) {
                    return ListTile(
                      title: Text(ingredient),
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