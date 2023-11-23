import 'package:billbook_app/app/modules/product/widgets/cardBill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../data/models/billBookModel.dart';
import '../controller.dart';
import 'favorite.dart';

class ProductListScreen extends GetView<ProductController> {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            child: TextFormField(
              controller: controller.searchController,
              onChanged: (value) {
                controller.filterSearch(value);
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                focusColor: Colors.black,
                contentPadding: EdgeInsets.only(right: 40.w, left: 12.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                labelText: "Search Videos...",
                counterStyle: Theme.of(context).textTheme.bodyLarge,
                helperStyle: Theme.of(context).textTheme.bodyLarge,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.tune_outlined),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.searchActive.isTrue) {
          // Display a ListView for filtered data
          return ListView.builder(
            itemCount: controller.filteredItems.length,
            itemBuilder: (context, index) {
              Datum item = controller.filteredItems[index];
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: CardBillWidget(
                  datum: item,
                  onPressedDelete: () {},
                  isTeamDetailScreen: false,
                ),
              );
            },
          );
        } else {
          // Display the PagedListView for paginated data
          return PagedListView<int, Datum>(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Datum>(
              itemBuilder: (context, item, index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: CardBillWidget(
                  datum: item,
                  isTeamDetailScreen: false,
                ),
              ),
              noMoreItemsIndicatorBuilder: (context) => Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text("No More Data Available"),
                ),
              ),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => FavoriteScrren());
          },
          label: Text("Favorite Details")),
    );
  }
}
