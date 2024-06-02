import 'package:flutter/material.dart';

import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import '../show_details/show_details.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      RoutesNames.home: (ctx) => const HomeScreen(),
      RoutesNames.cart: (ctx) => const CartScreen(),
      RoutesNames.showDetails: (ctx) => const ShowDetailsScreen(),
    };
  }
}

class RoutesNames {
  static const String home = '/HOME';
  static const String cart = '/CART';
  static const String showDetails = '/SHOW_DETAILS';
}
