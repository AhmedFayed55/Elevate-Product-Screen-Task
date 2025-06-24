import 'package:elevate_task/products_screen/domain/entity/product_response_entity.dart';

import '../../../core/errors/failures.dart';

abstract class ProductsStates {}

class GetAllProductsLoadingState extends ProductsStates {}

class GetAllProductsErrorState extends ProductsStates {
  Failures failures;

  GetAllProductsErrorState({required this.failures});
}

class GetAllProductsSuccessState extends ProductsStates {
  List<ProductResponseEntity> responseEntity;

  GetAllProductsSuccessState({required this.responseEntity});
}
