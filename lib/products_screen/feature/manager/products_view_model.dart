import 'package:elevate_task/products_screen/domain/use_case/get_all_products_use_case.dart';
import 'package:elevate_task/products_screen/feature/manager/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsVIewModel extends Cubit<ProductsStates> {
  ProductsVIewModel({required this.useCase})
    : super(GetAllProductsLoadingState());
  GetAllProductsUseCase useCase;

  void getAllProducts() async {
    emit(GetAllProductsLoadingState());
    var either = await useCase.invoke();
    either.fold(
      (error) {
        emit(GetAllProductsErrorState(failures: error));
      },
      (response) {
        emit(GetAllProductsSuccessState(responseEntity: response));
      },
    );
  }
}
