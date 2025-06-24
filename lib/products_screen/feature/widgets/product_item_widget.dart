import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_task/products_screen/domain/entity/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import 'custom_txt.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final ProductResponseEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Constants.primary30Opacity, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  width: 191.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  imageUrl: product.image ?? '',
                  placeholder:
                      (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: Constants.primaryDark,
                        ),
                      ),
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                )),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: Constants.whiteColor,
                  radius: 17.r,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        // todo add to favorite
                      },
                      color: Constants.primaryColor,
                      padding: EdgeInsets.zero,
                      iconSize: 30.r,
                      // Adjust icon size as needed
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  maxLines: 2,
                  text: product.title ?? "",
                  fontSize: 12.sp,
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomTxt(text: product.price.toString()),
                    SizedBox(width: 8.w),
                    CustomTxt(
                      text: "EGP ${(product.price! * 1.25).toStringAsFixed(2)}",
                      textStyle: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Constants.primaryDark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomTxt(text: "Review (${product.rating!.rate})",
                        fontSize: 12.sp),
                    Icon(Icons.star, color: Constants.yellowColor, size: 25.sp),
                    const Spacer(flex: 1),
                    InkWell(
                      onTap: () {
                        //   todo add to cart
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
