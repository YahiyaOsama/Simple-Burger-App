class Product {
  int id;
  String title;
  String image;
  String subtitle;
  String description;
  bool isFav;
  double price;
  bool isAddedToCart = false;

  Product(
      {required this.id,
      required this.title,
      required this.image,
      required this.subtitle,
      required this.description,
      required this.isFav,
      required this.price});

  factory Product.fromJson(int id, Map<String, dynamic> map) {
    return Product(
        id: id,
        title: map['title'],
        image: map['image'],
        subtitle: map['subTitle'],
        description: map['description'],
        isFav: map['isFav'],
        price: double.parse(map['price'] as String));
  }
}
