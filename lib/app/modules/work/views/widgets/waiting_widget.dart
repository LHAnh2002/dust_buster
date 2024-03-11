import 'package:dust_buster/app/common/values/styles/app_text_style.dart';
import 'package:dust_buster/app/modules/widgets/custom_status_widget.dart';
import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/util/exports.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16).r,
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.kGray100Color,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.04),
                        blurRadius: 6.r,
                        spreadRadius: -2,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.08),
                        blurRadius: 15.r,
                        spreadRadius: -3,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16)
                            .r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dọn dẹp nhà',
                              style: AppTextStyle.lableBodyStyle,
                            ),
                            CustomStatusWidget(
                              width: 133.w,
                              height: 24.h,
                              widget: Row(
                                children: [
                                  SizedBox(
                                    width: 16.w,
                                    height: 16.h,
                                    child: SvgPicture.asset(
                                      AppImages.iconAccessTime,
                                      fit: BoxFit.cover,
                                      color: AppColors.kGray500Color,
                                    ),
                                  ),
                                  SizedBox(width: 4.w, height: 0.0),
                                  Text(
                                    'Chờ nhận việc',
                                    style: AppTextStyle.textbodyStyle.copyWith(
                                      color: AppColors.kGray500Color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 8, bottom: 15)
                                .r,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16.w,
                              height: 16.h,
                              child: SvgPicture.asset(
                                AppImages.iconAccessTime,
                                fit: BoxFit.cover,
                                color: AppColors.kGray500Color,
                              ),
                            ),
                            SizedBox(width: 4.w, height: 0.0),
                            Text(
                              'Đăng vài giây trước',
                              style: AppTextStyle.textxsmallStyle.copyWith(
                                color: AppColors.kGray500Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.kGray100Color,
                        height: 1.h,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16).r,
                        child: Column(
                          children: [
                            const JobDetailsWidget(
                              image: AppImages.iconDate,
                              text: 'Thứ 2, 16/01/2023',
                            ),
                            SizedBox(width: 0.0, height: 12.h),
                            const JobDetailsWidget(
                              image: AppImages.iconTime,
                              text: '3 giờ, 10:00 đến 13:00',
                            ),
                            SizedBox(width: 0.0, height: 12.h),
                            const JobDetailsWidget(
                              image: AppImages.iconRepeat,
                              text: 'Thứ 3, Thứ 5, Thứ 7',
                            ),
                            SizedBox(width: 0.0, height: 12.h),
                            const JobDetailsWidget(
                              image: AppImages.iconLocation2,
                              text:
                                  '10 Đường số 5, An Hải Bắc, Sơn Trà, Đà Nẵng, 550000, Việt Nam',
                            ),
                            SizedBox(width: 0.0, height: 12.h),
                            const JobDetailsWidget(
                              image: AppImages.iconPrice,
                              text: '350,000đ',
                            ),
                            SizedBox(width: 0.0, height: 12.h),
                            const JobDetailsWidget(
                              image: AppImages.iconNote,
                              text:
                                  'Vui lòng đảm bảo im lặng trong quá trình làm việc.',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: AppColors.kGray100Color,
                        height: 1.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16).r,
                        child: JobDetailsWidget(
                          image: AppImages.iconAvtUser,
                          text: 'Đang chờ người nhận việc...',
                          textStyle: AppTextStyle.textbodyStyle.copyWith(
                            color: AppColors.kPurplePurpleColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
