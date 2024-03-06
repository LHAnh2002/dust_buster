import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../common/util/exports.dart';

class ButtonEndowWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? widget;
  final String text;
  const ButtonEndowWidget(
      {Key? key, required this.onTap, this.widget, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text),
          Row(
            children: <Widget>[
              widget ?? const SizedBox(width: 0.0, height: 0.0),
              SizedBox(width: 10.w, height: 0.0),
              Icon(
                Ionicons.chevron_forward_outline,
                size: 18.sp,
              )
            ],
          )
        ],
      ),
    );
  }
}
