import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entity/product_response_entity.dart';

abstract class ProductsDataSource {
  Future<Either<Failures, List<ProductResponseEntity>>> getAllProducts();
}
