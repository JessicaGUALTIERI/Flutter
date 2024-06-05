import 'package:easy_pizza/models/pizza.dart';
import 'package:easy_pizza/pizza_liked.dart';
import 'package:easy_pizza/screens/pizza_details.dart';
import 'package:easy_pizza/screens/pizzas_master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_pizza/data/pizzas.dart' as db;
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PizzaLiked(),
      child: const MainApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext conext, GoRouterState state) {
        return const PizzasMaster();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details/:pizzaId',
          builder: (BuildContext context, GoRouterState state) {
            final String? pizzaId = state.pathParameters['pizzaId'];
            Pizza pizzaWithId = db.pizzas.firstWhere((element) => element.id == pizzaId);
            return PizzaDetails(pizza: pizzaWithId);
          }
        )
      ]
    )
  ]
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
