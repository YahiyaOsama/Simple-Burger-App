import 'package:b/view/home/widgets/products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_controller.dart';
import '../app_router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductController>(context, listen: false);
    Future.delayed(Duration.zero, () {
      controller.fetchProducts();
    });
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(56, 56, 56, 1.0),
          bottomNavigationBar: SizedBox(
            height: 55,
            child: Stack(
              children: [
                Consumer<ProductController>(
                  builder: (context, controller, child) {
                    return BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: const Color.fromRGBO(56, 56, 56, 1.0),
                      selectedItemColor: Colors.orange,
                      unselectedItemColor: Colors.grey,
                      currentIndex: controller.currentPage,
                      onTap: (index) {
                        if (index == 2) {
                          Navigator.pushNamed(context, RoutesNames.cart);
                          return;
                        }
                        controller.updatePage(index);
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.email), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.add,
                              size: 0,
                            ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.notifications), label: ''),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.person), label: ''),
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesNames.cart);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 3),
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2),
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                spreadRadius: 0,
                                blurRadius: 1),
                          ]),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color.fromRGBO(56, 56, 56, 1.0),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hot & Fast Food',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Delivers on Time',
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
                const SizedBox(
                  height: 10,
                ),
                DefaultTabController(
                    length: 4,
                    child: Expanded(
                      child: Column(
                        children: [
                          const TabBar(tabs: [
                            Tab(
                              text: 'Burger',
                            ),
                            Tab(
                              text: 'Burger',
                            ),
                            Tab(
                              text: 'Burger',
                            ),
                            Tab(
                              text: 'Burger',
                            )
                          ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              Consumer<ProductController>(
                                builder: (context, value, child) {
                                  return ProductsGridView(
                                      lessHeight: constraints.maxWidth >= 1000,
                                      crossCount:
                                          getCrossCount(constraints.maxWidth),
                                      controller: value);
                                },
                              ),
                              const SizedBox(),
                              const SizedBox(),
                              const SizedBox()
                            ]),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  int getCrossCount(double width) {
    if (width <= 350) {
      return 1;
    } else if (width <= 515) {
      return 2;
    } else if (width <= 710) {
      return 3;
    } else {
      return 4;
    }
  }
}
