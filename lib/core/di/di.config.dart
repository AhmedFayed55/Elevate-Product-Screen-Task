// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../products_screen/data/data_source/products_data_source_impl.dart'
    as _i875;
import '../../products_screen/data/repositories/products_repository_impl.dart'
    as _i706;
import '../../products_screen/domain/repos/products_data_source.dart' as _i941;
import '../../products_screen/domain/repos/products_repository.dart' as _i107;
import '../../products_screen/domain/use_case/get_all_products_use_case.dart'
    as _i476;
import '../../products_screen/feature/manager/products_view_model.dart'
    as _i953;
import '../networking/api_manager.dart' as _i943;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i943.ApiManager>(() => _i943.ApiManager());
    gh.factory<_i941.ProductsDataSource>(
      () => _i875.ProductsDataSourceImpl(apiManager: gh<_i943.ApiManager>()),
    );
    gh.factory<_i107.ProductsRepository>(
      () => _i706.ProductsRepositoryImpl(
        dataSource: gh<_i941.ProductsDataSource>(),
      ),
    );
    gh.factory<_i476.GetAllProductsUseCase>(
      () => _i476.GetAllProductsUseCase(
        repository: gh<_i107.ProductsRepository>(),
      ),
    );
    gh.factory<_i953.ProductsVIewModel>(
      () => _i953.ProductsVIewModel(useCase: gh<_i476.GetAllProductsUseCase>()),
    );
    return this;
  }
}
