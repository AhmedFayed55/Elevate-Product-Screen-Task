import 'package:elevate_task/products_screen/domain/entity/product_response_entity.dart';

class ProductResponseDm extends ProductResponseEntity {
  ProductResponseDm({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
    super.rating,
  });

  ProductResponseDm.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? RatingDm.fromJson(json['rating']) : null;
  }
}

class RatingDm extends RatingEntity {
  RatingDm({super.rate, super.count});

  RatingDm.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
}
