import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';
import '../../model/product.dart';

class ShowDetailsScreen extends StatelessWidget {
  const ShowDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductController>(context, listen: false);
    provider.quantity = 0;
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 56, 56, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(56, 56, 56, 1.0),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 300,
                child: Image.asset(product.image),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    provider.dec();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Consumer<ProductController>(
                  builder: (context, controller, child) {
                    return Text(
                      controller.quantity.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    provider.inc();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Consumer<ProductController>(
                    builder: (context, controller, child) {
                      return Text(
                        '\$${product.price * controller.quantity}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                        height: 50,
                        child: Consumer<ProductController>(
                          builder: (context, controller, child) {
                            return ElevatedButton.icon(
                              onPressed: () {
                                if (product.isAddedToCart) {
                                  controller.removeFromCart(product);
                                } else if (controller.quantity > 0) {
                                  controller.addToCart(product,
                                      quantity: controller.quantity);
                                }
                              },
                              icon: const Icon(Icons.shopping_cart),
                              label: product.isAddedToCart
                                  ? const Text('Remove From Cart')
                                  : const Text('Buy Now'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ))),
                            );
                          },
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
