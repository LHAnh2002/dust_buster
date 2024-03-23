import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:dust_buster/app/modules/work/views/widgets/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaitingsWidget extends StatelessWidget {
  final String lable;
  final String time;
  final String workingDay;
  final String workTime;
  final String repeat;
  final String location;
  final String price;
  final String employeeNotes;
  final String petNotes;
  final String status;
  const WaitingsWidget(
      {Key? key,
      required this.lable,
      required this.time,
      required this.workingDay,
      required this.repeat,
      required this.location,
      required this.price,
      required this.employeeNotes,
      required this.petNotes,
      required this.workTime,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170.w,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      lable,
                      style: AppTextStyle.lableBodyStyle,
                    ),
                  ),
                  OrderStatus(
                    status: status,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 15).r,
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
                    time,
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
                  JobDetailsWidget(
                    image: AppImages.iconDate,
                    text: workingDay,
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconTime,
                    text: workTime,
                  ),
                  if (repeat != "")
                    Column(
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        JobDetailsWidget(
                          image: AppImages.iconRepeat,
                          text: repeat,
                        ),
                      ],
                    ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconLocation2,
                    text: location,
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconPrice,
                    text: price,
                  ),
                  if (employeeNotes != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text("Ghi chú cho Người làm",
                            style: AppTextStyle.textbodyStyle),
                        SizedBox(width: 0.0, height: 4.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          text: employeeNotes,
                        ),
                      ],
                    ),
                  if (petNotes != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text("Ghi chú cho Thú cưng",
                            style: AppTextStyle.textbodyStyle),
                        SizedBox(width: 0.0, height: 4.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          text: petNotes,
                        ),
                      ],
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
    );
  }
}
