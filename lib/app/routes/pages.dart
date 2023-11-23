import 'package:billbook_app/app/modules/product/binding.dart';
import 'package:billbook_app/app/modules/product/view/view.dart';
import 'package:get/get.dart';

class GetPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => ProductListScreen(),
      binding: ProductBinding(),
    ),
  ];
}
