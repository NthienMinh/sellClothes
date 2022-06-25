import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/controller/invoice.dart';
import 'package:mobile_ui/models/invoice.dart';
import 'package:mobile_ui/models/user.dart';
import 'package:mobile_ui/screens/cart_history/cart_history_screen.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';
import 'package:mobile_ui/shared_Preferences.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HistoryForm extends StatefulWidget {
  const HistoryForm({Key? key}) : super(key: key);

  @override
  State<HistoryForm> createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm> {
  User user = User();
  List<Invoice> invoice = [];

  
   late PersistentTabController _controller;
  @override
  void initState() {
    super.initState();
    
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var id = await  BaseSharedPreferences.getString('user_id');
      invoice = await InvoiceController.getInvoices(int.parse(id));
        setState(() {}); 

    });
    _controller = PersistentTabController(initialIndex: 0);
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: Dimensions.number10,
          top: Dimensions.number10,
          left: Dimensions.number10),
      child: ListView.builder(
        reverse: true,
        itemCount: invoice.length,itemBuilder: (context, i) =>   
        Container(
              height: Dimensions.number100 * 1.2,
              margin: EdgeInsets.only(bottom: Dimensions.number15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: DateFormat('dd/MM/yyyy').format(invoice[i].invoiceCreatedAt!).toString() ),
                  SizedBox(height: Dimensions.number10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Wrap(
                            direction: Axis.horizontal,
                            children: [
                              ...invoice[i].listDetails!.take(3).map((e) {
                                return  Container(
                                      height: Dimensions.number70,
                                      width: Dimensions.number70,
                                      margin: EdgeInsets.only(
                                          right: Dimensions.number5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.border15),
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(e.productImg??''))),
                                    )
                                  ;
                              } 
                             )
                            ]),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, CartHistoryscreen.routeName, arguments: {'invoice':invoice[i]}),
                        child: Container(
                          height: Dimensions.number70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallText(text: 'Tổng: ', color: Colors.red),
                              SmallText(
                                  text: invoice[i].invoiceTotalPayment.toString() + ' VND', color: Colors.red),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.number20,
                                    vertical: Dimensions.number5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.number5),
                                    border: Border.all(
                                        width: 1, color: AppColor.mainColor)),
                                child: SmallText(
                                  text: "Chi tiết",
                                  color: AppColor.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
        ))
    );
  }
}
