import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/screens/all_products/all_female_product_form.dart';
import 'package:mobile_ui/screens/all_products/all_male_products_form.dart';
import 'package:mobile_ui/screens/cart/cart_screen.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/app_icon.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../models/product.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> products = [];
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await getProducts();
      setState(() {});
    });
    _controller = PersistentTabController(initialIndex: 0);
  }

  bool men = true;
  bool woman = false;
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: Stack(children: [
        Positioned(
            top: Dimensions.number25 * 1.5,
            left: Dimensions.number15,
            right: Dimensions.number15,
            child: Row(
              children: [
                Container(
                  width: Get.context!.width*0.75,
                  height: Dimensions.number40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.number15),
                  ),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onChanged: (value) async {
                      await getProducts(q: value);
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Tìm kiếm...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColor.mainColor,
                        )),
                  ),
                ),
                SizedBox(width: Dimensions.number15),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, CartScreen.routeName),
                  child: AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppColor.mainColor,
                    size: Dimensions.number40,
                  ),
                ),
              ],
            )),
        Positioned(
            top: Dimensions.number100 * 0.85,
            left: Dimensions.number15,
            right: Dimensions.number15,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    men = true;
                    woman = false;
                    show = true;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.number100,
                    height: Dimensions.number30,
                    child: BigText(text: 'Male'),
                    decoration: BoxDecoration(
                        color: men ? AppColor.checked : AppColor.unchecked,
                        borderRadius:
                            BorderRadius.circular(Dimensions.border20),
                        border: Border.all(color: Colors.grey)),
                  ),
                ),
                SizedBox(width: Dimensions.number10),
                GestureDetector(
                  onTap: () {
                    men = false;
                    woman = true;
                    show = false;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.number100,
                    height: Dimensions.number30,
                    child: BigText(text: 'FeMale'),
                    decoration: BoxDecoration(
                      color: woman ? AppColor.checked : AppColor.unchecked,
                      borderRadius: BorderRadius.circular(Dimensions.border20),
                      border: Border.all(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            )),
        Positioned(
            top: Dimensions.number100 * 1.2,
            left: Dimensions.number15,
            right: Dimensions.number15,
            bottom: 0,
            child: show
                ? AllMaleProductsForm(products: products)
                : AllFeMaleProductsForm(products: products))
      ]),
    );
  }

  Future<void> getProducts({String q = ''}) async {
    String productsAdd = "/products";
    BaseAPI _baseAPI = BaseAPI();
    if (q == '') {
      await _baseAPI.getData(productsAdd).then((value) {
        if (value.apiStatus == API_STATUS.SUSSCESSED) {
          products.clear();

          value.object.forEach((element) {
            products.add(Product.fromJson(element));
          });
        }
      });
    } else {
      await _baseAPI.getData('/product/search', params: {'q': q}).then((value) {
        if (value.apiStatus == API_STATUS.SUSSCESSED) {
          products.clear();

          value.object.forEach((element) {
            products.add(Product.fromJson(element));
          });
        }
      });
    }
    print("---------------------" + products[0].productName!);
  }
}
