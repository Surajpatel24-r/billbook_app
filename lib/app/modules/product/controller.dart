import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../data/models/billBookModel.dart';
import '../../data/Api/apiService.dart';

class ProductController extends GetxController {
  static const _pageSize = 10;
  final PagingController<int, Datum> pagingController =
      PagingController(firstPageKey: 1);

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await ApiService.getProducts(pageKey, _pageSize);
      // Sort the new items by ID in increasing order
      newItems!.sort((a, b) => a.id!.compareTo(b.id!));
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  // =============== Search Products ====================
  var searchActive = false.obs;
  var filteredItems = <Datum>[].obs;
  void filterSearch(String query) {
    if (query.isEmpty) {
      searchActive.value = false;
      filteredItems.clear();
      filteredItems.addAll(pagingController.itemList ?? []);
    } else {
      searchActive.value = true;
      var lowercaseQuery = query.toLowerCase();
      filteredItems.value = pagingController.itemList!
          .where((item) => item.name!.toLowerCase().contains(lowercaseQuery))
          .toList();
    }
  }

  // ============== Add Favorite ========================
  var favorites = <Datum>[].obs;

  void addToFavorites(Datum item) {
    final isAlreadyFavorite =
        favorites.any((favorite) => favorite.id == item.id);

    if (!isAlreadyFavorite) {
      favorites.add(item);
      // Optionally show a message that the item has been added
      Get.snackbar(
        "Added to Favorites",
        "${item.name} has been added to your favorites.",
      );
    } else {
      // Optionally show a message that the item is already in favorites
      Get.snackbar(
        "Already in Favorites",
        "${item.name} is already in your favorites.",
      );
    }
  }

  // ============== Remove Favorite ========================
  void removeFromFavorites(Datum item) {
    favorites.remove(item);
    // Update the UI accordingly
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
