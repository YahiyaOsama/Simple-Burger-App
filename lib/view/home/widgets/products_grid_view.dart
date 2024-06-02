import 'package:b/view/home/widgets/product_item.dart';
import 'package:flutter/material.dart';

import '../../../controller/product_controller.dart';
import '../../app_router/app_router.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView(
      {super.key,
      required this.crossCount,
      required this.controller,
      required this.lessHeight});

  final int crossCount;
  final ProductController controller;
  final bool lessHeight;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossCount,
          childAspectRatio: lessHeight ? 1 / 0.7 : 1 / 1.2),
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return AnimatedOpacity(
          opacity: controller.isVisible ? 1 : 0,
          duration: Duration(milliseconds: 300 * index),
          child: ProductItem(
            product: product,
            onTap: () {
              Navigator.pushNamed(context, RoutesNames.showDetails,
                  arguments: product);
            },
            onCartClick: () {
              if (product.isAddedToCart) {
                controller.removeFromCart(product);
              } else {
                controller.addToCart(product);
              }
            },
          ),
        );
      },
    );
  }
}
