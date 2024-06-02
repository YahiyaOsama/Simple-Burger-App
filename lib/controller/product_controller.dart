import 'package:flutter/cupertino.dart';

import '../model/cart_model.dart';
import '../model/product.dart';
import '../service/data_source.dart';

class ProductController with ChangeNotifier {
  ProductDataSource productDataSource;

  ProductController(this.productDataSource);

  bool isLoading = false;
  bool isVisible = false;
  List<Product> products = [];
  List<CartModel> cartItems = [];

  Future fetchProducts() async {
    isLoading = true;
    products = await productDataSource.getProducts();
    print('PRODUCTS : $products');
    isLoading = false;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 300));
    isVisible = true;
    notifyListeners();
  }

  int quantity = 0;

  void inc() {
    quantity++;
    print(quantity);
    notifyListeners();
  }

  void dec() {
    if (quantity == 0) {
      return;
    }
    quantity--;
    print(quantity);
    notifyListeners();
  }

  void addToCart(Product product, {int quantity = 1}) {
    product.isAddedToCart = true;
    cartItems.add(CartModel(quantity, product));
    notifyListeners();
  }

  void removeFromCart(Product product) {
    product.isAddedToCart = false;
    cartItems.removeWhere((e) => e.product.id == product.id);
    notifyListeners();
  }

  void decItem(CartModel cartItem) {
    if (cartItem.quantity == 1) {
      removeFromCart(cartItem.product);
      return;
    }
    cartItem.quantity = cartItem.quantity - 1;
    notifyListeners();
  }

  void incItem(CartModel cartItem) {
    cartItem.quantity = cartItem.quantity + 1;
    notifyListeners();
  }

  int currentPage = 0;
  void updatePage(int index){
    currentPage = index;
    notifyListeners();
  }
}
