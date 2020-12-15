class GetProduct {
  int id;
  String name;
  String image;
  int price;
  String category;
  String description;
  int leftInStock;
  String size;
  int timesBought;
  int timesLiked;

  GetProduct(
      {this.id,
      this.name,
      this.image,
      this.price,
      this.category,
      this.description,
      this.leftInStock,
      this.size,
      this.timesBought,
      this.timesLiked});

  factory GetProduct.fromJson(Map<String, dynamic> json) {
    return GetProduct(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        category: json['category'],
        description: json['description'],
        leftInStock: json['left_in_stock'],
        size: json['size'],
        timesBought: json['times_bought'],
        timesLiked: json['times_liked']);
  }
}
