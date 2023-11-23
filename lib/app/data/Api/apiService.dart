import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/billBookModel.dart';

class ApiService {
  static Future<List<Datum>?> getProducts(int page, int pageSize) async {
    var url = Uri.parse(
        'https://app.apnabillbook.com/api/product?storeId=4ad3de84-bcaa-4bb2-9eb9-1846844e3314&page=$page&pageSize=$pageSize&productCategoryId&date=2023-11-01+21%3A49%3A44.451');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return BillBookModel.fromJson(data).data?.data;
    }
    return null;
  }
}
