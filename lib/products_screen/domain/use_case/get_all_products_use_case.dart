import 'package:dartz/dartz.dart';
import 'package:elevate_task/products_screen/domain/entity/product_response_entity.dart';
import 'package:elevate_task/products_screen/domain/repos/products_repository.dart';

import '../../../core/errors/failures.dart';

class GetAllProductsUseCase {
  ProductsRepository repository;

  GetAllProductsUseCase({required this.repository});

  Future<Either<Failures, List<ProductResponseEntity>>> invoke() {
    return repository.getAllProducts();
  }
}
