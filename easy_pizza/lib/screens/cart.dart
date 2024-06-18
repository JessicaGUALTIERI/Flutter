
import 'package:easy_pizza/cart_provider.dart';
import 'package:easy_pizza/models/pizza_cart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider pizzasInCart = Provider.of<CartProvider>(context, listen: false);
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
                "Panier",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Merriweather',
                    fontWeight: FontWeight.bold,
                  ),
              ),
          ],) 
        ),
        body: Center(
          child: Consumer<CartProvider>(
            builder: (context, pizzaCart, child) {
              if (pizzasInCart.pizzasShopped.isEmpty) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Opacity(
                      opacity: 0.75, 
                      child: Image.asset('images/sad.png'),
                    ),
                    const Text("Votre panier est vide",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: pizzasInCart.pizzasShopped.length,
                      itemBuilder: (BuildContext context, int index) {
                        final PizzaCart pizza = pizzasInCart.pizzasShopped[index];
                        return ListTile(
                          title: Text(
                            pizza.pizza.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),),
                          subtitle: Text("Quantité : ${pizza.quantity.toString()} | Prix total : ${pizzasInCart.getTotalPriceByPizza(pizza)}€ (${pizza.pizza.price}€/pizza)"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {pizzasInCart.addPizza(pizza);}, 
                                icon: const Icon(Icons.add_rounded),
                              ),
                              IconButton(
                                onPressed: () {pizzasInCart.removeOnePizza(pizza);}, 
                                icon: const Icon(Icons.remove_rounded),
                              ),
                              IconButton(
                                onPressed: () {pizzasInCart.removePizza(pizza);}, 
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
                      child: Text(
                        "Total de la commande : ${pizzasInCart.getTotalPrice().toString()}€",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      child: ElevatedButton(
                        onPressed: () {pizzasInCart.removeAllPizzas();}, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: const Text(
                          "Vider tout le panier",
                          style: TextStyle(
                            fontSize: 18,
                          )
                        ),
                      ),
                    ),
                    
                  ],
                ),
              );
            }
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