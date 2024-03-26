import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:dust_buster/app/modules/work/views/widgets/order_status.dart';
import 'package:dust_buster/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/pending_invoices_models/pending_invoices.dart';
import '../../exports.dart';

class WaitingsWidget extends StatelessWidget {
  final PendingInvoices? model;
  final String title;
  final WaitingController controller;
  const WaitingsWidget(
      {Key? key,
      required this.model,
      required this.title,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.jobDetails, arguments: model);
      },
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
                      title,
                      style: AppTextStyle.lableBodyStyle,
                    ),
                  ),
                  OrderStatus(
                    status: controller
                        .getStatus(int.parse(model!.orderStatus.toString())),
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
                    Utils.formatTimeAgo(model!.postingTime.toString()),
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
                    text: model!.workingDay.toString(),
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconTime,
                    text: model!.workTime.toString(),
                  ),
                  if (model!.repeat.toString() != "")
                    Column(
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        JobDetailsWidget(
                          image: AppImages.iconRepeat,
                          text: model!.repeat.toString(),
                        ),
                      ],
                    ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconLocation2,
                    text: model!.location.toString(),
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  JobDetailsWidget(
                    image: AppImages.iconPrice,
                    text: model!.price.toString(),
                  ),
                  if (model!.employeeNotes.toString() != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text("Ghi chú cho Người làm",
                            style: AppTextStyle.textbodyStyle),
                        SizedBox(width: 0.0, height: 4.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          text: model!.employeeNotes.toString(),
                        ),
                      ],
                    ),
                  if (model!.petNotes.toString() != "")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 0.0, height: 12.h),
                        Text("Ghi chú cho Thú cưng",
                            style: AppTextStyle.textbodyStyle),
                        SizedBox(width: 0.0, height: 4.h),
                        JobDetailsWidget(
                          image: AppImages.iconNote,
                          text: model!.petNotes.toString(),
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
