import 'package:flutter/material.dart';
import 'package:responsive_list_with_api_data/constant/appsize.dart';
import 'package:responsive_list_with_api_data/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_list_with_api_data/screens/home_page.dart';
import '../models/currency_model.dart';

class DetailsPage extends StatelessWidget {
  final CurrencyModel currency; // دریافت داده مربوط به ارز

  const DetailsPage({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60.w,
        leading: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              ); // بازگشت به صفحه home
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: true,
        title: Text(
          'نرخ   بروز   ارز   و   طلا',
          style: TextStyle(
            fontSize: Appsize.fontTitle,
            fontFamily: 'hamrah',
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
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
                        currency.name,
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
          SizedBox(height: Appsize.sizedBoxMedium),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  width: 300.w,
                  height: 276.h,
                  decoration: BoxDecoration(
                    color: ColorsApp.secondaryColor,
                    borderRadius: BorderRadius.circular(Appsize.radiusSmall),
                    boxShadow: [
                      BoxShadow(
                        color: ColorsApp.ButtonColor.withOpacity(0.1),
                        blurRadius: 9,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currency.name_en,
                        style: TextStyle(
                          shadows: [
                            BoxShadow(
                              color: ColorsApp.ButtonColor.withOpacity(0.4),
                              blurRadius: 19,
                              offset: const Offset(0, 0),
                            ),
                          ],
                          fontSize: Appsize.fontTitle,
                          fontFamily: 'poppins',
                          color: ColorsApp.ButtonColor,
                        ),
                      ),
                      SizedBox(
                        height: Appsize.sizedBoxMedium,
                      ),
                      Text(
                        'تاریخ آخرین بروز رسانی: ${currency.date} ',
                        style: TextStyle(
                          color: ColorsApp.textWhiteColor,
                          fontSize: Appsize.fontLarge,
                          fontFamily: 'titr',
                        ),
                      ),
                      SizedBox(
                        height: Appsize.sizedBoxMedium,
                      ),
                      Text(
                        'زمان آخرین بروزرسانی: ${currency.time}',
                        style: TextStyle(
                          color: ColorsApp.textWhiteColor,
                          fontSize: Appsize.fontLarge,
                          fontFamily: 'titr',
                        ),
                      ),
                      SizedBox(
                        height: Appsize.sizedBoxMedium,
                      ),
                      Text(
                        'آخرین تغییر مبلغ به تومان:  , ${currency.change_value}',
                        style: TextStyle(
                          color: ColorsApp.textWhiteColor,
                          fontSize: Appsize.fontLarge,
                          fontFamily: 'titr',
                        ),
                      ),
                      SizedBox(
                        height: Appsize.sizedBoxMedium,
                      ),
                      Text(
                        'آخرین قیمت:  ${currency.price}  ${currency.unit}',
                        style: TextStyle(
                          color: ColorsApp.textWhiteColor,
                          fontSize: Appsize.fontLarge,
                          fontFamily: 'titr',
                        ),
                      ),
                      SizedBox(
                        height: Appsize.sizedBoxMedium,
                      ),
                      Text(
                        'درصد تغییر نسبت به آخرین قیمت:  , ${currency.change_percent}%',
                        style: TextStyle(
                          color: ColorsApp.textWhiteColor,
                          fontSize: Appsize.fontLarge,
                          fontFamily: 'titr',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Appsize.sizedBoxMedium),
          // SvgPicture.asset('assets/SVG/detailsPageSVG.svg',
          //     width: 133.w,
          //     height: 133.h,
          //     colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn)
          //     // fit: BoxFit.contain,
          //     ),
          Image.asset(
            'assets/SVG/detailPagePNG1.png',
            width: 260.w,
            height: 160.h,
            fit: BoxFit.contain, // تعیین نحوه نمایش تصویر
          )
        ],
      ),
    );
  }
}
