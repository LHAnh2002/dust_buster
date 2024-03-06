import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../util/exports.dart';

class AppImages {
  ///add app images here
  const AppImages._();

  static SizedBox svg(
    String name, {
    Color? color,
    double? width,
    double? height,
    Widget Function(BuildContext context)? placeholderBuilder,
    String defaultImage = "",
    BoxFit fit = BoxFit.contain,
  }) {
    return SizedBox(
      width: width ?? Dimens.fontSize20,
      height: height ?? Dimens.fontSize20,
      child: SvgPicture.asset(
        name,
        color: color,
        fit: fit,
        allowDrawingOutsideViewBox: true,
      ),
    );
  }

  static Widget svgUrl(String name,
      {Color? color,
      double? width,
      double? height,
      BoxFit fit = BoxFit.contain,
      bool circle = false,
      Widget? placeholderWidget,
      Map<String, String>? header,
      EdgeInsets padding = const EdgeInsets.all(6.0)}) {
    return Padding(
      padding: padding,
      child: SvgPicture.network(
        name,
        color: color,
        placeholderBuilder: (context) => placeholderWidget ?? Container(),
        width: width,
        height: height,
        fit: fit,
        headers: header,
      ),
    );
  }

  //auth
  static const String homePage = 'assets/icons/home.svg';
  static const String promotions = 'assets/icons/promotions.svg';
  static const String notification = 'assets/icons/notification.svg';
  static const String iconMedai = 'assets/icons/medal.png';
  static const String iconTicket = 'assets/icons/ticket.svg';
  static const String imageHinhAnh = 'assets/images/hinh_anh.jpg';
  static const String iconHistory = 'assets/icons/history.svg';
  static const String iconRight = 'assets/icons/right.svg';
  static const String iconComplete = 'assets/icons/complete_tb.svg';
  static const String iconAvartar = 'assets/icons/avartar.png';
}
