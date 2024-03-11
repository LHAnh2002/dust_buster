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
  static const String iconMedai = 'assets/icons/medal.png';
  static const String iconTicket = 'assets/icons/ticket.svg';
  static const String imageHinhAnh = 'assets/images/hinh_anh.jpg';
  static const String iconHistory = 'assets/icons/history.svg';
  static const String iconComplete = 'assets/icons/complete_tb.svg';


  //chính
  static const String logo3Clean = 'assets/images/3clean-master-logo.svg';
  static const String illustration = 'assets/images/Illustration.svg';
  static const String iconBack = 'assets/icons/iconBack.svg';
  static const String iconCircleCheck = 'assets/icons/circle_check_24px.svg';
  static const String iconCloseCircleFill =
      'assets/icons/close-circle-fill.svg';
  static const String homePage = 'assets/icons/home-smile-2-fill.svg';
  static const String iconWork = 'assets/icons/work.svg';
  static const String iconNotification = 'assets/icons/notification.svg';
  static const String iconAccount = 'assets/icons/account_circle.svg';
  static const String imageHeader = 'assets/images/image_header.png';
  static const String iconLocation = 'assets/icons/location.svg';
  static const String iconLocation2 = 'assets/icons/location_2.svg';
  static const String iconWallet = 'assets/icons/wallet-fill.svg';
  static const String iconCopperDiamond = 'assets/icons/copper-diamond.svg';
  static const String iconVector = 'assets/icons/Vector.svg';
  static const String iconHouseCleaning = 'assets/icons/house_cleaning.svg';
  static const String iconmore = 'assets/icons/more.svg';
  static const String iconCleaning_1 = 'assets/images/cleaning_1.png';
  static const String iconAccessTime = 'assets/icons/access_time.svg';
  static const String iconDate = 'assets/icons/date.svg';
  static const String iconNote = 'assets/icons/note.svg';
  static const String iconPrice = 'assets/icons/price.svg';
  static const String iconRepeat = 'assets/icons/repeat.svg';
  static const String iconTime = 'assets/icons/time.svg';
  static const String iconAvtUser = 'assets/icons/avtUser.svg';
  static const String iconActionLeft = 'assets/icons/action_Left.svg';
  static const String iconAddLocation = 'assets/icons/addLocation.svg';
  static const String iconSearchLine = 'assets/icons/search-line.svg';
  static const String iconMapPinRange = 'assets/icons/map-pin-range.svg';
  static const String iconMapPin = 'assets/icons/map-pin.svg';
  static const String errorNoData = 'assets/images/error_no_data.svg';
  static const String error404 = 'assets/images/error_404.svg';
  static const String iconClose = 'assets/icons/close.svg';
  static const String iconRight = 'assets/icons/right_icon.svg';
  static const String iconEdit = 'assets/icons/action_Icon.svg';
  static const String iconClean = 'assets/icons/clean.svg';
}
