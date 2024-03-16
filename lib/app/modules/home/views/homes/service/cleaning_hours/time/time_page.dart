import 'package:flutter/material.dart';

import '../../../../../../../common/util/exports.dart';
import '../../../../../exports.dart';

class TimePage extends StatelessWidget {
  final CleaningController controller;
  const TimePage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 0.0, height: 24.h),
        Text(
          'Thời lượng',
          style: AppTextStyle.lableBodyStyle,
        ),
        SizedBox(width: 0.0, height: 4.h),
        Text(
          'Vui lòng chọn ước tính chính xác diện tính cần dọn dẹp',
          style: AppTextStyle.textsmallStyle
              .copyWith(color: AppColors.kGray500Color),
        ),
        SizedBox(width: 0.0, height: 16.h),
        Wrap(
          spacing: 8.w, // Khoảng cách giữa các hình ảnh
          runSpacing: 8.h, // Khoảng cách giữa các dòng
          children: List.generate(
            4,
            (index) {
              final optionTitles = ['2 giờ', '3 giờ', '3,5 giờ', '4 giờ'];
              final optionDescriptions = [
                '55 m2/ 2 phòng',
                '85 m2/ 3 phòng',
                '85 m2/ 3 phòng',
                '110 m2/ 4 phòng'
              ];
              return Obx(
                () => ButtonWidget(
                  onTap: () => controller.selectTimeOption(index),
                  widget: Container(
                    width: 167.w,
                    height: 48.h,
                    padding: const EdgeInsets.all(6).r,
                    decoration: BoxDecoration(
                      color: controller.selectedTimeOption.value == index
                          ? AppColors.kGray1000Color
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12).r,
                      border: Border.all(color: AppColors.kGray300Color),
                    ),
                    child: Column(
                      children: [
                        Text(
                          optionTitles[index],
                          style: AppTextStyle.textbodyStyle.copyWith(
                              color:
                                  controller.selectedTimeOption.value == index
                                      ? AppColors.white
                                      : AppColors.black),
                        ),
                        Expanded(
                          child: Text(
                            optionDescriptions[index],
                            style: AppTextStyle.textsmallStyle10.copyWith(
                                color:
                                    controller.selectedTimeOption.value == index
                                        ? AppColors.white
                                        : AppColors.kGray500Color),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
