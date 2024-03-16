import 'package:flutter/material.dart';

import '../../../../../../../common/util/exports.dart';
import '../../../../../../widgets/button_widget.dart';

class LocationServiceWidget extends StatelessWidget {
  const LocationServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vị trí làm việc',
          style: AppTextStyle.textButtonStyle
              .copyWith(color: AppColors.kGray1000Color),
        ),
        SizedBox(width: 0.0, height: 8.h),
        Container(
          height: 87.h,
          width: 343.w,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8).r,
          decoration: BoxDecoration(
            color: AppColors.kGray100Color,
            borderRadius: BorderRadius.circular(8).r,
            border: Border.all(color: AppColors.kGray100Color),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Xóm 4',
                    style: AppTextStyle.textbodyStyle,
                  ),
                  ButtonWidget(
                    onTap: () {},
                    widget: Container(
                      height: 24.h,
                      width: 67.w,
                      padding:
                          const EdgeInsets.symmetric(vertical: 4, horizontal: 7)
                              .r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16).r,
                        border: Border.all(color: AppColors.kGray1000Color),
                      ),
                      child: Text(
                        Strings.change,
                        style: AppTextStyle.textsmallStyle12,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 0.0, height: 7.h),
              Expanded(
                child: Text(
                  '10 Đường số 5, An hải bắc, sơn trà, đà nẵng, 550000. Việt nam',
                  style: AppTextStyle.textxsmallStyle
                      .copyWith(fontFamily: 'PlusJakartaSans'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
