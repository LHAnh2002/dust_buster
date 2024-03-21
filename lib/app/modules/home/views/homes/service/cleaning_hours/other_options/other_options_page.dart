import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherOptionsPage extends StatelessWidget {
  final CleaningController controller;
  const OtherOptionsPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 0.0, height: 24.h),
        Text(
          'Tùy Chọn khác',
          style: AppTextStyle.lableBodyStyle,
        ),
        SizedBox(width: 0.0, height: 8.h),
        Container(
          width: 343.w,
          height: 56.h,
          padding: const EdgeInsets.all(16).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColors.kGray200Color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Ưu tiên người làm yêu thích",
                    style: AppTextStyle.textbodyStyle,
                  ),
                  SizedBox(width: 4.w, height: 0.0),
                  ButtonWidget(
                    onTap: () {},
                    widget: SizedBox(
                      height: 20.h,
                      width: 24.w,
                      child: SvgPicture.asset(
                        AppImages.iconErrorWarningLine,
                        width: 16.w,
                        height: 16.h,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => CustomSwitch(
                  value: controller.isFavoriteMaker.value.obs,
                  onToggle: (bool value) {
                    controller.isFavoriteMaker.value = value;
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Container(
          width: 343.w,
          height: 56.h,
          padding: const EdgeInsets.all(15).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12).r,
            border: Border.all(color: AppColors.kGray200Color),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Nhà Có vật nuôi",
                        style: AppTextStyle.textbodyStyle,
                      ),
                      SizedBox(width: 4.w, height: 0.0),
                      ButtonWidget(
                        onTap: () {},
                        widget: SizedBox(
                          height: 20.h,
                          width: 24.w,
                          child: SvgPicture.asset(
                            AppImages.iconErrorWarningLine,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => CustomSwitch(
                      value: controller.isPet.value.obs,
                      onToggle: (bool value) {
                        controller.isPet.value = value;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
