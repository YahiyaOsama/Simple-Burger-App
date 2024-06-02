import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/product_controller.dart';
import '../../../model/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      required this.product,
      required this.onTap,
      required this.onCartClick});

  final Product product;
  final VoidCallback onTap;
  final VoidCallback onCartClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromRGBO(56, 56, 56, 1.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3),
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2),
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 1),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(product.image),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              product.title,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              product.subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(
              height: 5,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${product.price}',
                    style: const TextStyle(color: Colors.white)),
                IconButton(
                    onPressed: onCartClick,
                    icon: Consumer<ProductController>(
                      builder: (context, controller, child) {
                        return product.isAddedToCart
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.add_shopping_cart_sharp,
                                color: Colors.white,
                              );
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
