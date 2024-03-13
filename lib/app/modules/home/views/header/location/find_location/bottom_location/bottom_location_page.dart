import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomLocationPage extends StatelessWidget {
  final FindLocationController controller;
  const BottomLocationPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      boder: false.obs,
      onTap: () async {
        controller.fetchCurrentLocation();
      },
      widget: Obx(
        () => Column(
          children: [
            if (controller.isLoadingAutoLocation.value == false)
              Container(
                color: AppColors.white,
                height: 44.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.kBrightPurpleColor,
                            AppColors.kDarkPurpleColor,
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcIn,
                      child: SvgPicture.asset(
                        AppImages.iconMapPinRange,
                        color: Colors.white,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(width: 8.w, height: 0.0),
                    Text(
                      'Tự động lấy địa chỉ',
                      style: AppTextStyle.textsmallStyle
                          .copyWith(color: AppColors.black),
                    )
                  ],
                ),
              ),
            if (controller.isLoadingAutoLocation.value == true)
              Column(
                children: [
                  Container(
                    color: AppColors.white,
                    height: 35.h,
                    width: 35.w,
                    child: const CircularProgressIndicator(
                      backgroundColor: AppColors.kButtonColor,
                      color: AppColors.kBrightPurpleColor,
                    ),
                  ),
                  SizedBox(width: 0.0, height: 8.h),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
