// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../data/models/billBookModel.dart';
import '../controller.dart';

class CardBillWidget extends StatelessWidget {
  final Datum datum;
  void Function()? onPressedAdd;
  void Function()? onPressedDelete;
  final bool isTeamDetailScreen;
  Color? color;
  RxBool isFavorite = false.obs;
  CardBillWidget(
      {super.key,
      required this.datum,
      this.onPressedAdd,
      this.onPressedDelete,
      this.color,
      required this.isTeamDetailScreen})
      : isFavorite = RxBool(isTeamDetailScreen);

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w, top: 5.h),
                    child: Text(
                      "Id: ${datum.id}",
                      style: TextStyle(fontSize: 10.sp),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: CircleAvatar(
                        radius: 26.r,
                        backgroundColor: Colors.cyan[100],
                        child: CachedNetworkImage(
                          imageUrl: datum.productImage ?? '',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${datum.name}",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.8.h),
                          child: Text(
                            "Price: ${datum.price}, MRP: ${datum.mrp}",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              isTeamDetailScreen
                  ? Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Obx(() => IconButton(
                                    onPressed: onPressedDelete,
                                    icon: Icon(
                                        controller.favorites.contains(datum)
                                            ? Icons.favorite
                                            : Icons.favorite_border),
                                    color: controller.favorites.contains(datum)
                                        ? Colors.red
                                        : Colors.grey,
                                  )))
                        ],
                      ),
                    )
                  : Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Obx(() => IconButton(
                            onPressed: () {
                              controller.addToFavorites(datum);
                            },
                            icon: Icon(controller.favorites.contains(datum)
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: controller.favorites.contains(datum)
                                ? Colors.red
                                : Colors.grey,
                          )))
            ])
          ],
        ),
      ),
    );
  }
}
