import 'package:elevate_task/products_screen/feature/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductScreen extends StatelessWidget {
  static const String routeName = "Product_screen";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
                    itemCount: 16,
                    itemBuilder: (context, index) {
                      return ProductItemWidget();
                    },
                  ))
            ],
          ),
        )
    );
  }
}


