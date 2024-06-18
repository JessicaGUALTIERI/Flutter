import 'dart:collection';
import 'package:easy_pizza/models/pizza_cart.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<PizzaCart> _pizzaShopped = [];

  UnmodifiableListView<PizzaCart> get pizzasShopped => UnmodifiableListView(_pizzaShopped);

  double getTotalPrice() {
    double totalPrice = 0;
    _pizzaShopped.forEach((element) {totalPrice += (element.pizza.price * element.quantity);});
    return totalPrice;
  }

  double getTotalPriceByPizza(PizzaCart pizza) {
    double totalPriceByPizza = 0;
    _pizzaShopped.forEach((element) {element.pizza.id == pizza.pizza.id ? totalPriceByPizza += (element.pizza.price * element.quantity) : totalPriceByPizza += 0;});
    return totalPriceByPizza;
  }

  void addPizza(PizzaCart pizza) {
    int indexOfPizzaAlreadyInCart = _pizzaShopped.indexWhere((element) => element.pizza.id == pizza.pizza.id);
    if (indexOfPizzaAlreadyInCart >= 0) {
      _pizzaShopped[indexOfPizzaAlreadyInCart].quantity++;
    } else {
      _pizzaShopped.add(pizza);
    }
    notifyListeners();
  }

  int getQuantity(PizzaCart pizza) {
    int toReturn = 0;
    int indexOfPizzaAlreadyInCart = _pizzaShopped.indexWhere((element) => element.pizza.id == pizza.pizza.id);
    if (indexOfPizzaAlreadyInCart >= 0) {
      toReturn = _pizzaShopped[indexOfPizzaAlreadyInCart].quantity;
    }
    return toReturn;
  }

  void removePizza(PizzaCart pizza) {
    _pizzaShopped.remove(pizza);
    notifyListeners();
  }

  void removeAllPizzas() {
    _pizzaShopped.clear();
    notifyListeners();
  }

  void removeOnePizza(PizzaCart pizza) {
    PizzaCart concernedPizza = _pizzaShopped.firstWhere((element) => element.pizza.id == pizza.pizza.id);
    concernedPizza.quantity--;
    notifyListeners();
  }
}