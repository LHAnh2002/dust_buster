import 'package:dust_buster/app/modules/widgets/button_text_widget.dart';
import 'package:dust_buster/app/modules/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../common/util/exports.dart';

class EndowBlogWidget extends StatelessWidget {
  final String name;
  final int label;
  final VoidCallback onTapSeeMore;
  const EndowBlogWidget(
      {Key? key,
      required this.name,
      required this.label,
      required this.onTapSeeMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: label == 1 ? 256.h : 300.h,
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: AppTextStyle.largeBodyStyle,
                ),
                ButtonTextWidget(
                  onTap: onTapSeeMore,
                  text: Strings.seeMore,
                  textStyle: AppTextStyle.textbodyStyle.copyWith(
                    color: AppColors.kPurplePurpleColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 0.0, height: 8.h),
          SizedBox(
            height: label == 1 ? 185.h : 195.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16).r,
                  child: ButtonWidget( boder: false.obs,
                    onTap: () {},
                    widget: SizedBox(
                      width: 260.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 130.h,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      AppColors.kDarkyellowColor,
                                      AppColors.kBrightyellowColor,
                                    ],
                                    stops: [0.0, 1.0],
                                  ),
                                  borderRadius: BorderRadius.circular(8).r,
                                ),
                                child: Stack(
                                  children: [
                                    if (label == 2)
                                      SizedBox(
                                        width: double.infinity,
                                        height: 128.h,
                                        child: Center(
                                          child: Text(
                                            'Banner',
                                            style: AppTextStyle.textbodyStyle
                                                .copyWith(
                                              fontSize: 36.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (label == 1)
                                Positioned(
                                  top: 18.h,
                                  left: 16.w,
                                  child: SizedBox(
                                    width: 155.w,
                                    height: 95.h,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Giảm giá',
                                          style: AppTextStyle.textbodyStyle
                                              .copyWith(
                                            color: AppColors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          '20%',
                                          style: AppTextStyle.textbodyStyle
                                              .copyWith(
                                            color: AppColors.white,
                                            fontSize: 33.sp,
                                            fontFamily: "SFProDisplay",
                                          ),
                                        ),
                                        Text(
                                          'Chot tất cả các dịch vụ\ntừ 21/6/30/6/2024',
                                          style: AppTextStyle.textbodyStyle
                                              .copyWith(
                                            color: AppColors.white,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (label == 1)
                                Positioned(
                                  top: 7.h,
                                  left: 93.w,
                                  child: SizedBox(
                                    width: 144.w,
                                    height: 136.h,
                                    child: Image.asset(
                                      AppImages.iconCleaning_1,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 0.0, height: 8.h),
                          Text(
                            "GIẢM 25% TUẦN ĐẦU TRẢI NGHIỆM",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textbodyStyle,
                          ),
                          SizedBox(width: 0.0, height: 4.h),
                          Row(
                            children: [
                              if (label == 1)
                                SvgPicture.asset(
                                  AppImages.iconCopperDiamond,
                                  width: 16.w,
                                  height: 16.h,
                                ),
                              SizedBox(width: 2.w, height: 0),
                              if (label == 2)
                                Expanded(
                                  child: Text(
                                    "Tuyển dụng liên tục nhân viên giúp việc theo giờ Tuyển dụng liên tục nhân viên giúp việc theo giờ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.textsmallStyle.copyWith(
                                      fontSize: 10.sp,
                                      color: AppColors.kGrayTextColor,
                                    ),
                                  ),
                                ),
                              if (label == 1)
                                Text(
                                  "1500 điểm",
                                  style: AppTextStyle.textsmallStyle.copyWith(
                                    fontSize: 10.sp,
                                    fontFamily: "PlusJakartaSansRegular",
                                  ),
                                ),
                            ],
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
      ),
    );
  }
}
