import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_list_with_api_data/constant/appsize.dart';
import 'package:responsive_list_with_api_data/constant/Colors.dart';
import 'package:responsive_list_with_api_data/models/currency_model.dart';
import 'package:responsive_list_with_api_data/widgets/currency_list_widget.dart';
import 'package:responsive_list_with_api_data/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CurrencyModel>> currencyFuture;

  @override
  void initState() {
    super.initState();
    currencyFuture = ApiService().fetchAllMarketData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'نرخ بروز    ارز   و   طلا',
          style: TextStyle(
            fontSize: Appsize.fontTitle,
            fontFamily: 'hamrah',
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: Appsize.sizedBoxLarge),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 50.h,
              width: 300.w,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  right: 30.w,
                  top: 3.h,
                  child: Container(
                    height: 30.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorsApp.ButtonColor,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(Appsize.radiusSmall),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'لیست قیمت ارز  و  طلا',
                        style: TextStyle(
                          shadows: [
                            BoxShadow(
                              color: ColorsApp.ButtonColor.withOpacity(0.4),
                              blurRadius: 19,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          fontSize: Appsize.fontTitle,
                          fontFamily: 'hamrah',
                          color: ColorsApp.ButtonColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(height: Appsize.sizedBoxSmall),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  height: 400.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: ColorsApp.secondaryColor,
                    borderRadius: BorderRadius.circular(Appsize.radiusMedium),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsApp.ButtonColor.withOpacity(0.2),
                        blurRadius: 11,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(12.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Appsize.radiusMedium),
                      child: FutureBuilder<List<CurrencyModel>>(
                        future: currencyFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('خطا در دریافت اطلاعات'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                                child: Text('داده‌ای برای نمایش وجود ندارد'));
                          } else {
                            return CurrencyListWidget(
                              currencies: snapshot.data!,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Appsize.sizedBoxLarge),
          ElevatedButton(
            onPressed: () {
              setState(() {
                currencyFuture = ApiService().fetchAllMarketData();
              });
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorsApp.ButtonColor),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Appsize.radiusSmall),
                ),
              ),
            ),
            child: SizedBox(
              height: 36.h,
              width: 81.w,
              child: Row(
                children: [
                  Text(
                    'بروز رسانی',
                    style: TextStyle(
                      fontSize: Appsize.fontLarge,
                      fontFamily: 'hamrah',
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.refresh,
                    color: ColorsApp.primaryColor,
                    size: Appsize.fontTitle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
