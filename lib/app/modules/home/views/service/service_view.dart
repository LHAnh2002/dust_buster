import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/util/exports.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({Key? key}) : super(key: key);

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
                onTap: () {},
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
                            AppImages.iconHouseCleaning,
                            color: AppColors.kPurpleButtonColor,
                          ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Dọn dẹp nhà theo giờ',
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
                onTap: () {},
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
