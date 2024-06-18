import 'package:easy_pizza/models/pizza.dart';

class PizzaCart {
  Pizza pizza;
  int quantity;

  PizzaCart({
    required this.pizza,
    required this.quantity,
  });
}