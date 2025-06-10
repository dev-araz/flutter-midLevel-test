import 'package:flutter/material.dart';
import 'package:responsive_list_with_api_data/screens/home_page.dart';
import 'package:responsive_list_with_api_data/core/supabase_client.dart';
import 'package:responsive_list_with_api_data/constant/appsize.dart';
import 'package:responsive_list_with_api_data/constant/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //کنترل کننده های متن برای ایمیل و رمز عبور
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLogin = true;

  // متد برای تغییر وضعیت ورود یا ثبت نام
  Future<void> _authenticate() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // اعتبارسنجی اولیه
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ایمیل و رمز عبور نباید خالی باشند')),
      );
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لطفاً یک ایمیل معتبر وارد کنید')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('رمز عبور باید حداقل ۶ کاراکتر باشد')),
      );
      return;
    }

    try {
      if (isLogin) {
        // ورود
        await supabase.auth
            .signInWithPassword(email: email, password: password);
      } else {
        // ثبت‌نام
        final response =
            await supabase.auth.signUp(email: email, password: password);
        if (response.user == null) {
          throw Exception('ثبت‌نام موفق نبود. لطفاً دوباره تلاش کنید.');
        }
      }

      // در صورت موفقیت، انتقال به صفحه‌ی اصلی
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } catch (e) {
      // نمایش خطای Supabase
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا: ${e.toString()}')),
      );
      print('Authentication error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قیمت    ارز   و   طلا'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Appsize.sizedBoxExtraLarge),
            Text(' برای ورود به برنامه ابتدا ثبت نام کنید.',
                style: TextStyle(
                  fontFamily: 'hamrah',
                  fontSize: Appsize.fontTitle,
                  color: ColorsApp.textWhiteColor,
                )),
            SizedBox(height: Appsize.sizedBoxMedium),
            Container(
              padding: EdgeInsets.all(Appsize.paddingLarge),
              margin:
                  EdgeInsets.symmetric(horizontal: Appsize.paddingExtraLarge),
              decoration: BoxDecoration(
                color: ColorsApp.secondaryColor,
                borderRadius: BorderRadius.circular(Appsize.radiusMedium),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.ButtonColor.withOpacity(0.6),
                    blurRadius: 9,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    style: TextStyle(
                      fontSize: Appsize.fontMedium,
                      color: ColorsApp.textWhiteColor,
                    ),
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsApp.ButtonColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsApp.ButtonColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsApp.textWhiteColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                      labelText: 'ایمیل',
                      labelStyle: TextStyle(
                        fontSize: Appsize.fontMedium,
                        color: ColorsApp.textWhiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: Appsize.sizedBoxSmall),
                  TextField(
                    style: TextStyle(
                      fontSize: Appsize.fontMedium,
                      color: ColorsApp.textWhiteColor,
                    ),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsApp.ButtonColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsApp.textWhiteColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                      labelText: 'رمز عبور',
                      labelStyle: TextStyle(
                        fontSize: Appsize.fontMedium,
                        color: ColorsApp.textWhiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: Appsize.sizedBoxMedium),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.ButtonColor,
                      // elevation: 2,
                      // shadowColor: ColorsApp.ButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Appsize.radiusSmall),
                      ),
                    ),
                    onPressed: () {
                      _authenticate();
                    },
                    child: Text(
                      'ثبـت  نـام',
                      style: TextStyle(
                        fontFamily: 'hamrah',
                        fontSize: Appsize.fontLarge,
                        color: ColorsApp.textBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
