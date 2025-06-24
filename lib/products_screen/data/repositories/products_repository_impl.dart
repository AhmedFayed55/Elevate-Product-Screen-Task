import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/errors/failures.dart';
import 'package:elevate_task/products_screen/domain/entity/product_response_entity.dart';
import 'package:elevate_task/products_screen/domain/repos/products_data_source.dart';
import 'package:elevate_task/products_screen/domain/repos/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  ProductsDataSource dataSource;

  ProductsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failures, List<ProductResponseEntity>>> getAllProducts() async {
    var either = await dataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
