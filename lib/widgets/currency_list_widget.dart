import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_list_with_api_data/screens/details_page.dart';
import '../constant/appsize.dart';
import '../constant/Colors.dart';
import '../models/currency_model.dart';

class CurrencyListWidget extends StatelessWidget {
  final List<CurrencyModel> currencies;

  const CurrencyListWidget({super.key, required this.currencies});

  IconData? get icons => null;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        final currency = currencies[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Container(
            padding: EdgeInsets.all(12.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(Appsize.radiusSmall),
              border: Border.all(
                color: ColorsApp.ButtonColor,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorsApp.ButtonColor.withOpacity(0.1),
                  blurRadius: 9,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.name,
                  style: TextStyle(
                    fontSize: Appsize.fontLarge,
                    color: Colors.white,
                    fontFamily: 'titr',
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'قیمت: ${currency.price} ${currency.unit}',
                  style: TextStyle(
                    fontSize: Appsize.fontMedium,
                    color: Colors.white70,
                    fontFamily: 'titr',
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(currency: currency)),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        '${currency.date} - ${currency.time}',
                        style: TextStyle(
                          fontSize: Appsize.fontExtraSmall,
                          color: Colors.grey[400],
                          fontFamily: 'titr',
                        ),
                      ),
                      SizedBox(width: 26.w),
                      Text(
                        'جزئیات بیشتر',
                        style: TextStyle(
                          fontSize: Appsize.fontSmall,
                          color: ColorsApp.ButtonColor,
                        ),
                      ),
                      Icon(Icons.arrow_forward,
                          size: 16.w, color: ColorsApp.ButtonColor),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
