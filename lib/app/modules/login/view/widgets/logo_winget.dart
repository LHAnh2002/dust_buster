import 'package:flutter/material.dart';

import '../../../../common/util/exports.dart';

class LogoWinget extends StatelessWidget {
  const LogoWinget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Logo',
        style: AppTextStyle.text24BoldStyle.copyWith(
          fontSize: 30.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
