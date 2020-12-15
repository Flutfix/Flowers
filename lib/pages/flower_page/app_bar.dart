import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar customAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(252, 220, 255, 1),
          Color.fromRGBO(202, 227, 255, 1)
        ]),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/back_button.svg'),
        SvgPicture.asset('assets/images/logo.svg'),
        SvgPicture.asset('assets/images/star_disactive.svg'),
      ],
    ),
  );
}
