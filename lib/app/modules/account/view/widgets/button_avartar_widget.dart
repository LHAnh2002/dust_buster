import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonAvartarWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonAvartarWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24).r,
        child: ButtonWidget(
          onTap: () {},
          widget: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 64.w,
                height: 64.h,
                padding: const EdgeInsets.only(top: 9, right: 8, left: 8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.kBrightPurpleColor,
                      AppColors.kDarkPurpleColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  color: AppColors.kPurplePurpleColor,
                  borderRadius: BorderRadius.circular(48).r,
                ),
                child: SvgPicture.asset(
                  AppImages.iconVector,
                  height: 55.h,
                  width: 48.w,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                width: 223.w,
                height: 52.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('LHAnh', style: AppTextStyle.lableBodyStyle),
                    Text('Chỉnh sửa tài khoản',
                        style: AppTextStyle.textxsmallStyle),
                  ],
                ),
              ),
              SvgPicture.asset(
                AppImages.iconArrowright,
                height: 24.h,
                width: 24.w,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ));
  }
}
