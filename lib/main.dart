import 'package:elevate_task/products_screen/feature/page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';

void main() {
  configureDependencies();
  runApp(const ProductsApp());
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) => MaterialApp(
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            initialRoute: ProductScreen.routeName,
            routes: {ProductScreen.routeName: (_) => ProductScreen()},
          ),
    );
  }
}
