import 'package:dust_buster/app/common/util/exports.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const ButtonWidget({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45.h,
        decoration: BoxDecoration(
          color: AppColors.kButtonColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8).r,
          boxShadow: [
            BoxShadow(
              color: AppColors.kButtonColor.withOpacity(0.2),
              blurRadius: 10,
            )
          ],
        ),
        child: Text(
          text,
          style: AppTextStyle.buttonTextStyle.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
    );
  }
}
