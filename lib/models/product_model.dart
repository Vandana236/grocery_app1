class ProductModel {
  String imageUrl;
  String productName;
  String shortDescription;
  String longDescription;
  int productPrice;
  int quantity;

  ProductModel(
      {this.imageUrl,
      this.productName,
      this.shortDescription,
      this.longDescription,
      this.productPrice,
      this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    productName = json['product_name'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    productPrice = json['product_price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['product_name'] = this.productName;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['product_price'] = this.productPrice;
    data['quantity'] = this.quantity;
    return data;
  }
}
