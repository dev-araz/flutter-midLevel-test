import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../models/currency_model.dart';

class ApiService {
  static const String apiUrl =
      'https://brsapi.ir/Api/Market/Gold_Currency.php?key=FreeODpKEdlDXbxCvfhaCA2JwSrHji4r';

  /// دریافت و ترکیب gold، currency و cryptocurrency
  Future<List<CurrencyModel>> fetchAllMarketData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        List<CurrencyModel> allItems = [];

        // اگر داده مربوط به ارزها وجود داشت
        if (data.containsKey('currency')) {
          final currencyList = data['currency'] as List;
          allItems
              .addAll(currencyList.map((json) => CurrencyModel.fromJson(json)));
        }

        // اگر داده مربوط به طلا وجود داشت
        if (data.containsKey('gold')) {
          final goldList = data['gold'] as List;
          allItems.addAll(goldList.map((json) => CurrencyModel.fromJson(json)));
        }

        // اگر داده مربوط به کریپتو وجود داشت
        if (data.containsKey('cryptocurrency')) {
          final cryptoList = data['cryptocurrency'] as List;
          allItems
              .addAll(cryptoList.map((json) => CurrencyModel.fromJson(json)));
        }

        return allItems;
      } else {
        debugPrint("خطا در دریافت اطلاعات! کد وضعیت: ${response.statusCode}");
        throw Exception(
            "خطا در دریافت اطلاعات! کد وضعیت: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("مشکلی در دریافت داده‌ها پیش آمد: ${e.toString()}");
    }
  }
}
