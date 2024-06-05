import 'package:flutter/material.dart';
import 'package:easy_pizza/data/pizzas.dart' as db;
import 'package:easy_pizza/models/pizza.dart';
import 'package:go_router/go_router.dart';

class PizzasMaster extends StatelessWidget {
  const PizzasMaster({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: db.pizzas.length,
            itemBuilder: (BuildContext context, int index) {
              final Pizza currentPizza = db.pizzas[index];
              return ListTile(
                trailing: Image.asset("images/pizza.png"),
                title: Text(currentPizza.name),
                leading: Text("${currentPizza.price.toStringAsFixed(2)}€"),
                onTap: () => context.go('/details/${currentPizza.id}'),
                subtitle: Text("${currentPizza.ingredients.length.toString()} ingrédients"),
              );
            }),
        ),
      ),
    );
  }
}