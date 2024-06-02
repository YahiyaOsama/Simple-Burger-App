
import '../model/product.dart';

class ProductDataSource {
  Future<List<Product>> getProducts() async {
    final List<Product> res = [];
    final List<dynamic> jsonList = productsJson()['data'];
    int i = 0;
    for (var element in jsonList) {
      print(element);
      res.add(Product.fromJson(i++, element as Map<String, dynamic>));
    }
    print('AT_END : $res');
    return res;
  }

  Map<String, dynamic> productsJson() {
    return {
      "data": [
        {
          "title": "Cheese Burger",
          "image": "assets/pngwing.png",
          "subTitle": "Hot Burger",
          "description":
          "A cheeseburger is a classic sandwich made with a ground beef patty grilled to juicy perfection. The patty is nestled between a soft bun and topped with melty cheese, usually cheddar or American.  For a delicious twist, additional toppings like lettuce, tomato, onion, pickles, ketchup, mustard, and mayo can be added.",
          "quantity": 0,
          "isFav": false,
          "price": "55",
        },
        {
          "title": "Cheese Burger",
          "image": "assets/pngwing1.png",
          "description":
          "A cheeseburger is a classic sandwich made with a ground beef patty grilled to juicy perfection. The patty is nestled between a soft bun and topped with melty cheese, usually cheddar or American.  For a delicious twist, additional toppings like lettuce, tomato, onion, pickles, ketchup, mustard, and mayo can be added.",
          "subTitle": "Hot Burger",
          "quantity": 0,
          "isFav": false,
          "price": "55",
        },
        {
          "title": "Cheese Burger",
          "image": "assets/pngwing2.png",
          "description":
          "A cheeseburger is a classic sandwich made with a ground beef patty grilled to juicy perfection. The patty is nestled between a soft bun and topped with melty cheese, usually cheddar or American.  For a delicious twist, additional toppings like lettuce, tomato, onion, pickles, ketchup, mustard, and mayo can be added.",
          "subTitle": "Hot Burger",
          "quantity": 0,
          "isFav": false,
          "price": "55",
        },
        {
          "title": "Cheese Burger",
          "description":
          "A cheeseburger is a classic sandwich made with a ground beef patty grilled to juicy perfection. The patty is nestled between a soft bun and topped with melty cheese, usually cheddar or American.  For a delicious twist, additional toppings like lettuce, tomato, onion, pickles, ketchup, mustard, and mayo can be added.",
          "image": "assets/pngwing3.png",
          "subTitle": "Hot Burger",
          "quantity": 0,
          "isFav": false,
          "price": "55",
        },
      ]
    };
  }
}
