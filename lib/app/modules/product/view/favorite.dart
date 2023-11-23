import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller.dart';
import '../widgets/cardBill.dart';

class FavoriteScrren extends StatelessWidget {
  FavoriteScrren({super.key});

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
        ),
        body: controller.favorites.isEmpty
            ? Center(
                child: Text(
                  "favorite data not exist",
                  style: TextStyle(fontSize: 17.sp),
                ),
              )
            : Obx(() => ListView.builder(
                  itemCount: controller.favorites.length,
                  itemBuilder: (context, index) {
                    return CardBillWidget(
                      datum: controller.favorites[index],
                      onPressedDelete: () {
                        controller
                            .removeFromFavorites(controller.favorites[index]);
                        Get.snackbar("Removed", "Item removed from favorites");
                      },
                      isTeamDetailScreen: true,
                    );
                  },
                )));
  }
}
