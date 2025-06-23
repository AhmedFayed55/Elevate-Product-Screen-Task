import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants.dart';
import 'custom_txt.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 15.w),
      height: 242.h,
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
                child: Image.asset("assets/dummy_image.png", fit: BoxFit.cover),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: CircleAvatar(
                  backgroundColor: Constants.whiteColor,
                  radius: 20.r,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTxt(
                  text:
                      "Nike Air Jordon Nike shoes flexible for woman and men ",
                  fontSize: 12.sp,
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    CustomTxt(text: "EGP 400"),
                    SizedBox(width: 8.w),
                    CustomTxt(
                      text: "EGP ${400 * 1.23}",
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
                    CustomTxt(text: "Review (4.8)", fontSize: 12.sp),
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
