import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final Widget? widget;
  final Color? colorBackGroud;
  final TextStyle? textStyle;
  final RxBool? boder;
  const ButtonWidget({
    Key? key,
    required this.onTap,
    this.text,
    this.widget,
    this.colorBackGroud,
    this.boder,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: widget ??
          Container(
            alignment: Alignment.center,
            height: 45.h,
            decoration: BoxDecoration(
              color: colorBackGroud ?? AppColors.kButtonColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8).r,
              border: boder == true
                  ? Border.all(
                      color: AppColors.kGray1000Color,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kButtonColor.withOpacity(0.2),
                  blurRadius: 10,
                )
              ],
            ),
            child: Text(
              text ?? "",
              style: textStyle ?? AppTextStyle.textButtonStyle.copyWith(),
            ),
          ),
    );
  }
}
