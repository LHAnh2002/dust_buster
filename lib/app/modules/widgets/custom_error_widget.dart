import 'package:flutter/material.dart';
import '../../common/util/exports.dart';

class CustomErrorWidget extends StatelessWidget {
  final String e;
  const CustomErrorWidget({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(e,
          textAlign: TextAlign.center,
          style: AppTextStyle.bodyStyle.copyWith(color: Colors.white)),
    );
  }
}
