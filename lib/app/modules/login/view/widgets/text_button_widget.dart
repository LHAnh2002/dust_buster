import 'package:flutter/material.dart';

import '../../../../common/util/exports.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const TextButtonWidget({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Text(
        text,
        style: AppTextStyle.buttonTextStyle
            .copyWith(color: AppColors.kOrangeColor, fontSize: 13.5.sp),
      ),
    );
  }
}
