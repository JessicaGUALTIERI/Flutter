
import 'package:easy_pizza/cart_provider.dart';
import 'package:easy_pizza/likes_provider.dart';
import 'package:easy_pizza/models/pizza_cart.dart';
import 'package:flutter/material.dart';
import 'package:easy_pizza/data/pizzas.dart' as db;
import 'package:easy_pizza/models/pizza.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PizzasMaster extends StatelessWidget {
  const PizzasMaster({super.key});

  
  @override
  Widget build(BuildContext context) {
    LikesProvider pizzaLikedList = Provider.of<LikesProvider>(context, listen: false);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Image.asset('images/logo.png', height: 50, width: 50),
              const Spacer(),
              const Text(
                "Easy Pizzas",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => context.go('/cart'),
                color: Colors.white,
              ),
            ],
          ), 
        ),
        body: Center(
          child: 
              Consumer<LikesProvider>(
                builder: (context, pizza, child) {
                  return ListView.builder(
                      itemCount: db.pizzas.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Pizza currentPizza = db.pizzas[index];
                        return ListTile(
                          leading: Text("${currentPizza.price.toStringAsFixed(2)}€"),
                          title: Text(
                            currentPizza.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 18
                            ),
                          ),
                          subtitle: Text("${currentPizza.ingredients.length.toString()} ingrédients"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Consumer<CartProvider>(
                                builder: (context, cart, child) {
                                  return Row(
                                    children: [
                                      Text(
                                        cart.getQuantity(PizzaCart(pizza: currentPizza, quantity: 1)).toString(),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add_shopping_cart),
                                        onPressed: () {cart.addPizza(PizzaCart(pizza: currentPizza, quantity: 1));},
                                        color: Colors.orange,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.favorite),
                                onPressed: () {pizzaLikedList.pizzasLiked.contains(currentPizza) ? pizzaLikedList.remove(currentPizza) : pizzaLikedList.add(currentPizza);},
                                color: pizzaLikedList.pizzasLiked.contains(currentPizza) ? Colors.red : Colors.grey,
                              ),
                            ]
                          ,),
                          onTap: () => context.go('/details/${currentPizza.id}'),
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