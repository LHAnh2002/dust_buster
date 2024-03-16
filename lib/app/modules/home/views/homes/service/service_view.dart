import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/data/models/home_models/home_model.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/home/views/homes/service/service_all/sevice_all_buton.dart';
import 'package:flutter_svg/svg.dart';

class ServiceView extends StatelessWidget {
  final HomeModel? model;
  final HomeController controller;
  const ServiceView({Key? key, this.model, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 24.w, // Khoảng cách giữa các hình ảnh
        runSpacing: 16.h, // Khoảng cách giữa các dòng
        children: List.generate(
          8, // Số lượng hình ảnh, bao gồm cả hình ảnh cuối cùng
          (index) {
            if (index < 7) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  controller.navigateToNextScreen(
                    model!.service![index].label,
                    model!.id,
                    model!.idL,
                    model!.location2,
                    model!.service![index].name.toString(),
                  );
                },
                child: SizedBox(
                  width: 68.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 64.h,
                        width: 64.w,
                        padding: const EdgeInsets.all(12).r,
                        decoration: BoxDecoration(
                          color: AppColors.kGrayBackgroudColor,
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(
                            color: AppColors.kGrayBodyColor,
                          ),
                        ),
                        child: ClipRRect(
                          child: SvgPicture.network(
                            model!.service![index].icon.toString(),
                            color: AppColors.kPurpleButtonColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 0.0, height: 4.h),
                      Text(
                        textAlign: TextAlign.center,
                        model!.service![index].name.toString(),
                        style: AppTextStyle.textbodyStyle.copyWith(
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // Trường hợp hiển thị item cuối cùng
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  goPresent(children: [
                    SeviceAllButon(model: model, controller: controller),
                  ]);
                },
                child: SizedBox(
                  width: 68.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 64.h,
                        width: 64.w,
                        padding: const EdgeInsets.all(12).r,
                        decoration: BoxDecoration(
                          color: AppColors.kGrayBackgroudColor,
                          borderRadius: BorderRadius.circular(16).r,
                          border: Border.all(
                            color: AppColors.kGrayBodyColor,
                          ),
                        ),
                        child: ClipRRect(
                          child: SvgPicture.asset(
                            AppImages.iconmore,
                            color: AppColors.kPurpleButtonColor,
                          ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Xem Thêm',
                        style: AppTextStyle.textbodyStyle.copyWith(
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
