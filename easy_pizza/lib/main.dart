import 'package:easy_pizza/cart_provider.dart';
import 'package:easy_pizza/models/pizza.dart';
import 'package:easy_pizza/likes_provider.dart';
import 'package:easy_pizza/screens/cart.dart';
import 'package:easy_pizza/screens/details.dart';
import 'package:easy_pizza/screens/master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_pizza/data/pizzas.dart' as db;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LikesProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
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
        ),
        GoRoute(
          path: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return const Cart();
          },
        ),
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
