import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/util/exports.dart';

class ButtonEndowWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? widget;
  final String text;
  final String image;
  const ButtonEndowWidget(
      {Key? key, required this.onTap, this.widget, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.kDarkPurpleColor,
                        AppColors.kBrightPurpleColor,
                      ],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: SvgPicture.asset(
                    image,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
                SizedBox(width: 8.w, height: 0.0),
                Text(
                  text,
                  style: AppTextStyle.textsmallStyle60016,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                widget ?? const SizedBox(width: 0.0, height: 0.0),
                SizedBox(width: 10.w, height: 0.0),
                SvgPicture.asset(
                  AppImages.iconArrowright,
                  height: 24.h,
                  width: 24.w,
                  fit: BoxFit.fitHeight,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
