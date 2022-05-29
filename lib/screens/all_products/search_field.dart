import 'package:flutter/material.dart';
import 'package:mobile_ui/Colors.dart';
import 'package:mobile_ui/dimensions.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.number100 * 2.7,
      height: Dimensions.number40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.number15),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        // onSubmitted: (value) {
        //   // print(value);
        //   if (value.length >= 3) {
        //     Navigator.pushNamed(context, ProductScreen.routeName,
        //         arguments: ProductArguments(keyword: value));
        //   }
        // },
        // onChanged: (value) => print(value),
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
    );
  }
}
