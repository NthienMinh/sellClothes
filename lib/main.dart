import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/cart/cart_screen.dart';
import 'package:mobile_ui/clothes/recommanded_clothe_detail.dart';
import 'package:mobile_ui/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/main_screen/popular_product.dart';
import 'package:mobile_ui/routes.dart';
import 'package:mobile_ui/sign_in/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
