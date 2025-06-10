import 'package:flutter/material.dart';
// import 'screens/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constant/appsize.dart';
// import 'core/supabase_client.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 500));
  // await SupabaseConfig.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // سایز طراحی برای صفحه نمایش
      minTextAdapt: true, // تنظیم خودکار اندازه متن
      splitScreenMode: true, // فعال‌سازی حالت صفحه نمایش تقسیم شده
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Responsive list with Api data and Authentication',
          locale: const Locale('fa'), // فارسی
          supportedLocales: const [
            Locale('fa'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // appBarTheme: const AppBarTheme(
          //   backgroundColor: Color.fromARGB(255, 24, 45, 85),
          //   foregroundColor: Colors.white,
          // ),
          theme: ThemeData(
            fontFamily: 'yekan_bold',
            scaffoldBackgroundColor: Color.fromARGB(255, 24, 45, 85),
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                height: Appsize.appBarHeight,
                fontFamily: 'hamrah',
                fontSize: Appsize.fontTitle,
                color: Colors.white,
              ),
              backgroundColor: const Color.fromARGB(255, 24, 45, 85),
              foregroundColor: Colors.white,
            ),
          ),
          // home: supabase.auth.currentUser == null
          //     ? const LoginPage()
          //     : const HomePage(), // صفحه ورود یا صفحه اصلی بر اساس وضعیت ورود کاربر
          home: const HomePage(),
        );
      },
    );
  }
}
