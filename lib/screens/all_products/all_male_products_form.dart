import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/models/product.dart';
import 'package:mobile_ui/screens/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/icon_and_text_widgets.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';

class AllMaleProductsForm extends StatefulWidget {
  final List<Product> products;
  const AllMaleProductsForm({Key? key, required this.products})
      : super(key: key);

  @override
  State<AllMaleProductsForm> createState() => _AllMaleProductsFormState();
}

class _AllMaleProductsFormState extends State<AllMaleProductsForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: Dimensions.number5),
        color: Color(0xFFF4F4F4),
        child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              for (int i = 0; i < widget.products.length; i++)
                if (widget.products[i].productTypeId == 1)
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, PopularClotheDetail.routeName,
                        arguments: {'product': widget.products[i]}),
                    child: Container(
                      height: Dimensions.number100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.number100,
                            height: Dimensions.number100,
                            margin:
                                EdgeInsets.only(bottom: Dimensions.number10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.products[i].productImg ?? '')),
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.border15),
                                    bottomLeft:
                                        Radius.circular(Dimensions.border15),
                                    topRight:
                                        Radius.circular(Dimensions.border15)),
                                color: Colors.white),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions.number85,
                              //width: Dimensions.number100 * 2.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.border15),
                                    bottomLeft:
                                        Radius.circular(Dimensions.number7),
                                    bottomRight:
                                        Radius.circular(Dimensions.border15)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.number10,
                                    right: Dimensions.number10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(
                                        text: widget.products[i].productName ??
                                            ''),
                                    SizedBox(height: Dimensions.number10),
                                    SmallText(
                                        text: widget
                                                .products[i].productIntroduce ??
                                            ''),
                                    SizedBox(height: Dimensions.number10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.checkroom,
                                            iconColor: Colors.black,
                                            text: widget.products[i]
                                                    .productMaterial ??
                                                ''),
                                        SizedBox(width: Dimensions.number15),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            iconColor: AppColor.mainColor,
                                            text: widget.products[i]
                                                    .productLocation ??
                                                '')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            ]));
  }
}
