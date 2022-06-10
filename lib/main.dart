import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/routes.dart';
import 'package:mobile_ui/screens/cart/cart_screen.dart';
import 'package:mobile_ui/screens/forgot_password/body.dart';
import 'package:mobile_ui/screens/sign_in/sign_in_screen.dart';
import 'package:mobile_ui/store/cart_store.dart/cart_store.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  {
  @override
  void initState() {
    BaseAPI.API = "https://fteam-api.phatdev.xyz";
    //BaseAPI.API = "http://192.168.1.210:3000";
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CartStore>(create: (_)=>CartStore())
      ],

      child: GetMaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SignInScreen.routeName,
        routes: routes
      ),
    );
  }
}
