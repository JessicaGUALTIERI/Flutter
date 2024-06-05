
import 'package:easy_pizza/pizza_liked.dart';
import 'package:flutter/material.dart';
import 'package:easy_pizza/data/pizzas.dart' as db;
import 'package:easy_pizza/models/pizza.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PizzasMaster extends StatelessWidget {
  const PizzasMaster({super.key});

  
  @override
  Widget build(BuildContext context) {
    PizzaLiked pizzaLikedList = Provider.of<PizzaLiked>(context, listen: false);
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
              const Text(
                "Easy Pizzas",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold,
                  ),
              ),
            ],
          ), 
        ),
        body: Center(
          child: 
              Consumer<PizzaLiked>(
                builder: (context, pizza, child) {
                  return ListView.builder(
                      itemCount: db.pizzas.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Pizza currentPizza = db.pizzas[index];
                        return ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite),
                            onPressed: () {pizzaLikedList.pizzasLiked.contains(currentPizza) ? pizzaLikedList.remove(currentPizza) : pizzaLikedList.add(currentPizza);},
                            color: pizzaLikedList.pizzasLiked.contains(currentPizza) ? Colors.red : Colors.grey,
                          ),
                          title: Text(currentPizza.name),
                          leading: Text("${currentPizza.price.toStringAsFixed(2)}€"),
                          onTap: () => context.go('/details/${currentPizza.id}'),
                          subtitle: Text("${currentPizza.ingredients.length.toString()} ingrédients"),
                        );
                      }
                  );
                },
              ),
          ),
        ),
      );
  }
}