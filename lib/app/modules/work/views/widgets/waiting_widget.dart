import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../common/util/exports.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.kBlackLight2,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 7.r,
                      spreadRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, right: 6).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giúp việc theo giờ',
                            style: AppTextStyle.textButtonSmallStyle.copyWith(
                              color: AppColors.black,
                              fontSize: 15.sp,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 85.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(57, 255, 199, 69),
                              border: Border.all(
                                color: AppColors.kOrangeLight3,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Text(
                              'Đang chờ',
                              style: AppTextStyle.bodySmallStyle.copyWith(
                                color: AppColors.kOrangeLight3,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 0.0, height: 10.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 6).r,
                      child: Text(
                        'Đẵ đăng một phút trước',
                        style: AppTextStyle.bodySmallDescriptionStyle.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const Divider(
                      color: AppColors.kBlackLight2,
                      thickness: 1,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 6, top: 15).r,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Ionicons.calendar_outline,
                                color: AppColors.kGreenChart,
                              ),
                              SizedBox(width: 6.w, height: 0.0),
                              Text(
                                'Đẵ đăng 1 phút trước',
                                style: AppTextStyle.bodySmallDescriptionStyle
                                    .copyWith(
                                  color: AppColors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 0.0, height: 8.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.alarm_on_outlined,
                                color: AppColors.kGreenChart,
                              ),
                              SizedBox(width: 6.w, height: 0.0),
                              Text(
                                '2 giờ, 08:00 đến 10:00',
                                style: AppTextStyle.bodySmallDescriptionStyle
                                    .copyWith(
                                  color: AppColors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 0.0, height: 8.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.attach_money_outlined,
                                color: AppColors.kGreenChart,
                              ),
                              SizedBox(width: 6.w, height: 0.0),
                              Text(
                                '229,000 đ',
                                style: AppTextStyle.bodySmallDescriptionStyle
                                    .copyWith(
                                  color: AppColors.black,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 0.0, height: 8.h),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.kGreenChart,
                              ),
                              SizedBox(width: 6.w, height: 0.0),
                              Expanded(
                                child: Text(
                                  'Thôn 4, xã Đức Bồng, huyện Vũ Quang, tỉnh Hà Tĩnh',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.bodySmallDescriptionStyle
                                      .copyWith(
                                    color: AppColors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 0.0, height: 10.h),
                    const Divider(
                      color: AppColors.kBlackLight2,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                              left: 15, right: 6, top: 15, bottom: 20)
                          .r,
                      child: Text(
                        'Đang chờ người nhận việc...',
                        style: AppTextStyle.bodySmallDescriptionStyle.copyWith(
                          color: const Color.fromARGB(255, 255, 162, 22),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
