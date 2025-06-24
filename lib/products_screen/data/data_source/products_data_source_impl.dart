import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:elevate_task/core/errors/failures.dart';
import 'package:elevate_task/core/networking/api_manager.dart';
import 'package:elevate_task/products_screen/data/model/product_response_dm.dart';
import 'package:elevate_task/products_screen/domain/repos/products_data_source.dart';

import '../../../core/constants.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  ApiManager apiManager;

  ProductsDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, List<ProductResponseDm>>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
        var response = await apiManager.getData();
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          final List<dynamic> jsonList = response.data;
          final List<ProductResponseDm> products =
              jsonList.map((e) => ProductResponseDm.fromJson(e)).toList();
          return Right(products);
        } else {
          return Left(ServerError(errorMessage: Constants.errorMessage));
        }
      } else {
        //todo: no internet connection
        return Left(NetworkError(errorMessage: Constants.networkErrorMessage));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
