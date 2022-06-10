import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/cart.dart';
import 'package:mobile_ui/models/cart.dart';
import 'package:mobile_ui/models/product.dart';
import 'package:mobile_ui/screens/cart/cart_screen.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/widgets/app_icon.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/screens/widgets/text_widget.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PopularClotheDetail extends StatefulWidget {
  static String routeName = "/popularClotheDetail";

  const PopularClotheDetail({Key? key}) : super(key: key);

  @override
  State<PopularClotheDetail> createState() => _PopularClotheDetailState();
}

class _PopularClotheDetailState extends State<PopularClotheDetail> {
  Cart cart = Cart();
  late PersistentTabController _controller;
  int count = 1;
  int total = 0;
  bool check4 = true;
  bool check5 = false;
  bool check6 = false;
  bool check7 = false;
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var id = await  BaseSharedPreferences.getString('user_id');
      cart.userId = int.parse(id);
       setState(() {}); 
    });
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    Product product = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['product'] as Product;
    cart.productId = product.productId;
    total = int.parse(product.productPrice.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: Dimensions.number70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, CartScreen.routeName),
                    child: AppIcon(icon: Icons.shopping_cart_outlined))
              ],
            ),
            stretch: true,
            pinned: true,
            backgroundColor: AppColor.buttonBackgroundColor,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.number10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.border20),
                        topRight: Radius.circular(Dimensions.border20))),
                child: Center(
                  child: BigText(
                      size: Dimensions.font26, text: product.productName ?? ''),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.number5, bottom: Dimensions.number5),
              ),
            ),
            expandedHeight: 280,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(product.productImg ?? ''))))
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: Row(children: [
                  SizedBox(
                    width: Dimensions.number10,
                  ),
                  BigText(
                    text: 'Giá: ' + product.productPrice.toString() + ' VND',
                    color: Colors.red,
                    size: Dimensions.number25,
                  )
                ]),
              ),
              Container(
                child: TextWidget(text: product.productDetail ?? ''),
                margin: EdgeInsets.only(
                    left: Dimensions.number15, right: Dimensions.number15),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Dimensions.number10,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.number15, bottom: Dimensions.number10),
              child: Row(
                children: [
                  BigText(text: "Size: "),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = true;
                      check5 = false;
                      check6 = false;
                      check7 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.number7,
                          top: Dimensions.number5 * 0.5,
                          right: Dimensions.number5,
                        ),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(text: 'S')),
                      ),
                      decoration: BoxDecoration(
                          color: check4 ? AppColor.checked : AppColor.unchecked,
                          borderRadius:
                              BorderRadius.circular(Dimensions.number7),
                          border: Border.all(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = false;
                      check5 = true;
                      check6 = false;
                      check7 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Dimensions.number10 * 0.25,
                          left: Dimensions.number5,
                          right: Dimensions.number5,
                        ),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(text: 'M')),
                      ),
                      decoration: BoxDecoration(
                        color: check5 ? AppColor.checked : AppColor.unchecked,
                        borderRadius: BorderRadius.circular(Dimensions.number7),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = false;
                      check5 = false;
                      check6 = true;
                      check7 = false;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Dimensions.number10 * 0.25,
                          left: Dimensions.number7,
                          right: Dimensions.number5,
                        ),
                        //bottom: Dimensions.number10),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(text: 'L')),
                      ),
                      decoration: BoxDecoration(
                        color: check6 ? AppColor.checked : AppColor.unchecked,
                        borderRadius: BorderRadius.circular(Dimensions.number7),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(width: Dimensions.number10),
                  GestureDetector(
                    onTap: () {
                      check4 = false;
                      check5 = false;
                      check6 = false;
                      check7 = true;
                      setState(() {});
                    },
                    child: Container(
                      width: Dimensions.number30,
                      height: Dimensions.number30,
                      child: Padding(
                        padding: EdgeInsets.all(4.3),
                        child: Container(
                            width: Dimensions.number30,
                            height: Dimensions.number30,
                            child: BigText(
                              text: 'XL',
                              size: Dimensions.number10 * 1.62,
                            )),
                      ),
                      decoration: BoxDecoration(
                        color: check7 ? AppColor.checked : AppColor.unchecked,
                        borderRadius: BorderRadius.circular(Dimensions.number7),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: Dimensions.number70,
            padding: EdgeInsets.only(
                left: Dimensions.number25,
                right: Dimensions.number25,
                top: Dimensions.number15,
                bottom: Dimensions.number15),
            decoration: BoxDecoration(
                color: AppColor.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.border30),
                    topRight: Radius.circular(Dimensions.border30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (count > 1) {
                            count--;
                            total = product.productPrice! * count;
                          }
                          setState(() {});
                        },
                        child: AppIcon(
                            iconSize: Dimensions.number15,
                            iconColor: Colors.white,
                            backgroundColor: AppColor.mainColor,
                            icon: Icons.remove),
                      ),
                      SizedBox(width: Dimensions.number5),
                      BigText(
                        text: count.toString(),
                        color: AppColor.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      SizedBox(width: Dimensions.number5),
                      GestureDetector(
                        onTap: () {
                          count++;
                          total = product.productPrice! * count;
                          setState(() {});
                        },
                        child: AppIcon(
                            iconSize: Dimensions.number15,
                            iconColor: Colors.white,
                            backgroundColor: AppColor.mainColor,
                            icon: Icons.add),
                      )
                    ],
                  ),
                ),
                //Nút bấm thêm hàng, thành tiền
                GestureDetector(
                  onTap: () async {
                    if (count > 0) {
                      _showCupertinoDialog(context);
                      cart.cartProductQuantity = count;
                      if (check4 == true) {
                        cart.cartProductSize = "S";
                      } else if (check5 == true) {
                        cart.cartProductSize = "M";
                      } else if (check6 == true) {
                        cart.cartProductSize = "L";
                      } else if (check7 == true) {
                        cart.cartProductSize = "XL";
                      }
                      ;
                      bool status = await CartController.addCart(cart);
                    } 
                    else{
                      _showCupertinoDialog1(context);
                    }            
                    
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Dimensions.number100 * 1.9,
                    padding: EdgeInsets.only(
                        left: Dimensions.number20,
                        right: Dimensions.number20,
                        top: Dimensions.number10,
                        bottom: Dimensions.number10),
                    child: BigText(
                      text: total.toString() + " VND" + " | Add",
                      size: Dimensions.number15,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.border20),
                        color: AppColor.mainColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  _dismissDialog(BuildContext context) {
  Navigator.popAndPushNamed(context, HomePage.routeName);
}

void _showCupertinoDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: BigText(
            text: 'Thêm thành công!',
            color: AppColor.mainBlackColor,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog(context);
                  
                },
                child: SmallText(
                  text: 'Đóng',
                  color: AppColor.mainColor,
                )),
          ],
        );
      });
}
void _showCupertinoDialog1(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: BigText(
            text: 'Bạn phải chọn số lượng muốn mua!',
            color: AppColor.mainBlackColor,
            size: 14,
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog(context);
                  
                },
                child: SmallText(
                  text: 'Đóng',
                  color: AppColor.mainColor,
                )),
          ],
        );
      });
}
}


