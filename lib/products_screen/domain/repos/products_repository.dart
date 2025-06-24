import 'package:dartz/dartz.dart';
import 'package:elevate_task/products_screen/domain/entity/product_response_entity.dart';

import '../../../core/errors/failures.dart';

abstract class ProductsRepository {
  Future<Either<Failures, List<ProductResponseEntity>>> getAllProducts();
}
