import 'package:elevate_task/core/networking/api_manager.dart';
import 'package:elevate_task/products_screen/data/data_source/products_data_source_impl.dart';
import 'package:elevate_task/products_screen/data/repositories/products_repository_impl.dart';
import 'package:elevate_task/products_screen/domain/use_case/get_all_products_use_case.dart';
import 'package:elevate_task/products_screen/feature/manager/products_states.dart';
import 'package:elevate_task/products_screen/feature/manager/products_view_model.dart';
import 'package:elevate_task/products_screen/feature/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';


class ProductScreen extends StatelessWidget {
  static const String routeName = "Product_screen";

  ProductScreen({super.key});

  ProductsVIewModel vIewModel = ProductsVIewModel(useCase:
  GetAllProductsUseCase(repository: ProductsRepositoryImpl(dataSource:
  ProductsDataSourceImpl(apiManager: ApiManager()))));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: vIewModel..getAllProducts(),
      builder: (context, state) {
        if (state is GetAllProductsSuccessState) {
          return Scaffold(
              body: Padding(
                padding: REdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 2.7,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h),
                          itemCount: state.responseEntity.length,
                          itemBuilder: (context, index) {
                            return ProductItemWidget(product: state
                                .responseEntity[index],);
                          },
                        ))
                  ],
                ),
              )
          );
        } else if (state is GetAllProductsErrorState) {
          return Center(
            child: Text(state.failures.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Constants.primaryColor,
            ),
          );
        }
      },
    );
  }
}


