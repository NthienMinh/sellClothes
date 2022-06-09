import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/base_api.dart';
import 'package:mobile_ui/controller/cart.dart';
import 'package:mobile_ui/controller/user.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/models/cart.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/cart/cart_screen.dart';
import 'package:mobile_ui/screens/home/home_page.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:mobile_ui/store/cart_store.dart/cart_store.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ItemCartForm extends StatefulWidget {
  const ItemCartForm({Key? key}) : super(key: key);
  

  @override
  State<ItemCartForm> createState() => _ItemCartFormState();
}

class _ItemCartFormState extends State<ItemCartForm> {
  int total = 0;
  int temp = 0;
  User user = User();
  
  late CartStore cartStore;
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    cartStore = context.read<CartStore>();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var id = await  BaseSharedPreferences.getString('user_id');
      user = await UserController.getUser(int.parse(id));
       cartStore.cart.clear();
      cartStore.cart.addAll(await CartController.getCarts(user.userId!)) ;
      setState(() {}); 

    });
    _controller = PersistentTabController(initialIndex: 0);
  }
  
  @override
  Widget build(BuildContext context) {
    cartStore.total =0;
    return Container(
      margin: EdgeInsets.only(top: Dimensions.number10),
      color: Colors.white,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount:  cartStore.cart.length,
            itemBuilder: (_, index) {
              total = cartStore.total;
              temp = cartStore.cart[index].cartProductQuantity! *  cartStore.cart[index].productPrice!;
              total += temp;
              cartStore.total = total;
              return Container(
                height: Dimensions.number100,
                width: double.maxFinite,
                child: Row(
                  children: [
                    Container(
                      width: Dimensions.number100,
                      height: Dimensions.number100,
                      margin: EdgeInsets.only(bottom: Dimensions.number10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage( cartStore.cart[index].productImg!)),
                          borderRadius:
                              BorderRadius.circular(Dimensions.border15),
                          color: Colors.white),
                    ),
                    SizedBox(width: Dimensions.number10),
                    Expanded(
                        child: Container(
                      height: Dimensions.number100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BigText(
                              text:  cartStore.cart[index].productName!, color: Colors.black54),
                          SmallText(text: 'Size: '+ cartStore.cart[index].cartProductSize!, color: Colors.black54),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text:  cartStore.cart[index].productPrice!.toString() + ' VND' ,
                                color: Colors.redAccent,
                                size: Dimensions.font16,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: Dimensions.number15,
                                    right: Dimensions.number15,
                                    top: Dimensions.number5,
                                    bottom: Dimensions.number5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.border20),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        if (cartStore.cart[index]
                                                .cartProductQuantity! >
                                            0) {
                                          cartStore.cart[index]
                                              .cartProductQuantity = cartStore
                                                  .cart[index]
                                                  .cartProductQuantity! -
                                              1;
                                              temp = cartStore.cart[index].cartProductQuantity! *  cartStore.cart[index].productPrice!; 
                                              cartStore.total = cartStore.total -temp;
                                              bool status =
                                              await CartController.updateCart(
                                                  cartStore.cart[index]);
                                              setState(() {});
                                        }
                                        if (cartStore.cart[index]
                                                .cartProductQuantity! ==
                                            0) {
                                          bool status =
                                              await CartController.delCart(
                                                  cartStore.cart[index]);
                                            _showCupertinoDialog(context, text: 'Bạn đã xóa sản phẩm!');
                                          setState(() {});
                                        }
                                        setState(() {});
                                      },
                                      child: Icon(Icons.remove,
                                          color: AppColor.signColor),
                                    ),
                                    SizedBox(width: Dimensions.number7),
                                    BigText(text:  cartStore.cart[index].cartProductQuantity.toString()),
                                    SizedBox(width: Dimensions.number7),
                                    GestureDetector(
                                        onTap: () async {
                                           cartStore.cart[index].cartProductQuantity =  cartStore.cart[index].cartProductQuantity! + 1;
                                           bool status =
                                              await CartController.updateCart(
                                                  cartStore.cart[index]);
                                          setState(() {});
                                        },
                                        child: Icon(Icons.add,
                                            color: AppColor.signColor))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              );
            }),
      ),
    );
  }
    _dismissDialog(BuildContext context) {
  Navigator.popAndPushNamed(context, CartScreen.routeName);
  setState(() {
    
  });
}

void _showCupertinoDialog(BuildContext context, {required String text}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: BigText(
            text: text,
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
}
