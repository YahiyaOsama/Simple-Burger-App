import 'package:b/service/data_source.dart';
import 'package:b/view/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/product_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductController(ProductDataSource()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRouter.getRoutes(),
        initialRoute: RoutesNames.home,
      ),
    );
  }
}
