import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/util/exports.dart';

class NotificationWidget extends StatelessWidget {
  final int label;
  final String title;
  final String content;
  final String image;
  final Color? color;
  const NotificationWidget(
      {Key? key,
      required this.label,
      required this.title,
      required this.content,
      required this.image,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16).r,
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: 48.h,
                width: 343.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (label == 0)
                      ClipRRect(
                        child: Image.asset(
                          image,
                          width: 48.w,
                          height: 48.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (label != 0)
                      Container(
                        padding: const EdgeInsets.all(12).r,
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(48).r),
                        child: ClipRRect(
                          child: SvgPicture.asset(
                            image,
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 287.w,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: AppTextStyle.lableBodyStyle,
                              ),
                              Text(
                                '5 phút trước',
                                style: AppTextStyle.textsmallStyle12.copyWith(
                                  color: AppColors.kGray400Color,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: 251.w,
                                  child: Text(
                                    content,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.textsmallStyle,
                                  ),
                                ),
                              ),
                              if (label == 0)
                                Container(
                                  width: 66.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16).r,
                                    color: AppColors.kGray100Color,
                                  ),
                                  child: Center(
                                    child: Text(
                                      Strings.closed,
                                      style: AppTextStyle.textsmallStyle12
                                          .copyWith(
                                        color: AppColors.kGray500Color,
                                      ),
                                    ),
                                  ),
                                ),
                              if (label != 0)
                                Container(
                                  width: 8.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16).r,
                                    color: AppColors.kRrror400Color,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 32.h),
      ),
    );
  }
}
