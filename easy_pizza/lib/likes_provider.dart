
import 'dart:collection';

import 'package:easy_pizza/models/pizza.dart';
import 'package:flutter/material.dart';

class LikesProvider extends ChangeNotifier {
  final List<Pizza> _pizzaLiked = [];

  UnmodifiableListView<Pizza> get pizzasLiked => UnmodifiableListView(_pizzaLiked);

  void add(Pizza pizza) {
    _pizzaLiked.add(pizza);
    notifyListeners();
  }

  void remove(Pizza pizza) {
    _pizzaLiked.remove(pizza);
    notifyListeners();
  }
}