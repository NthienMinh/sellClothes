import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/cart.dart';
import 'package:mobile_ui/controller/invoice.dart';
import 'package:mobile_ui/controller/user.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/models/cart.dart';
import 'package:mobile_ui/models/invoice.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ItemCartHistoryForm extends StatefulWidget {
  const ItemCartHistoryForm({Key? key}) : super(key: key);

  @override
  State<ItemCartHistoryForm> createState() => _ItemCartHistoryFormState();
}

class _ItemCartHistoryFormState extends State<ItemCartHistoryForm> {
  User user = User();
  late Invoice invoice ;
  late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var id = await  BaseSharedPreferences.getString('user_id');
      // invoice = await InvoiceController.getInvoices(int.parse(id));
      invoice = (ModalRoute.of(context)!.settings.arguments
      as Map<String, dynamic>)['invoice'] as Invoice;
      setState(() {
        
      });

    });
    _controller = PersistentTabController(initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.number10),
      color: Colors.white,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
                itemCount: invoice.listDetails?.length,            
            itemBuilder: (_, index) {
              var element = invoice.listDetails?[index];
              return 
               Container(
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
                              image: NetworkImage(element!.productImg ?? '')),
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
                              text: element.productName ?? '', color: Colors.black54),
                          
                          SmallText(text: 'Size: '+ element.detailProductSize! , color: Colors.black54),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BigText(
                                text:element.productPrice!.toString() + ' VND',
                                color: Colors.redAccent,
                                size: Dimensions.font16,
                              ),
                              BigText(
                                text: "Số lượng :" + element.detailProductQuantity.toString(),
                                color: Colors.black54,
                                size: Dimensions.font16,
                              ),
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
}
