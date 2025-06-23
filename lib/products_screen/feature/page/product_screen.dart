import 'package:elevate_task/products_screen/feature/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';


class ProductScreen extends StatelessWidget {
  static const String routeName = "Product_screen";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProductItemWidget(),
      ),
    );
  }
}


