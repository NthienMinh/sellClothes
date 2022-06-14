import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/models/product.dart';
import 'package:mobile_ui/screens/clothes/popular_clothe_detail.dart';
import 'package:mobile_ui/dimensions.dart';
import 'package:mobile_ui/screens/widgets/big_text.dart';
import 'package:mobile_ui/screens/widgets/icon_and_text_widgets.dart';
import 'package:mobile_ui/screens/widgets/small_text.dart';

class popularProducts extends StatefulWidget {
  final List<Product> products;
  const popularProducts({Key? key, required this.products}) : super(key: key);

  @override
  State<popularProducts> createState() => _popularProductsState();
}

class _popularProductsState extends State<popularProducts> {
  PageController pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        });
  }

  Widget _buildPageItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, PopularClotheDetail.routeName,
            arguments: {
              'product': widget.products[widget.products.length - index - 1]
            }),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimensions.number100,
              height: Dimensions.number100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.border15),
                  color: Colors.white38,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget
                              .products[widget.products.length - index - 1]
                              .productImg ??
                          ''))),
            ),
            Container(
              height: Dimensions.number85,
              width: Dimensions.number100 * 2.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.border15),
                    bottomRight: Radius.circular(Dimensions.border15)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: Dimensions.number10, right: Dimensions.number10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                        text: widget
                                .products[widget.products.length - index - 1]
                                .productName ??
                            ''),
                    SizedBox(height: Dimensions.number10),
                    SmallText(
                        text: widget
                                .products[widget.products.length - index - 1]
                                .productIntroduce ??
                            ''),
                    SizedBox(height: Dimensions.number10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconAndTextWidget(
                            icon: Icons.checkroom,
                            iconColor: Colors.black,
                            text: widget
                                    .products[
                                        widget.products.length - index - 1]
                                    .productMaterial ??
                                ''),
                        SizedBox(width: Dimensions.number15),
                        IconAndTextWidget(
                            icon: Icons.location_on,
                            iconColor: AppColor.mainColor,
                            text: widget
                                    .products[
                                        widget.products.length - index - 1]
                                    .productLocation ??
                                '')
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
