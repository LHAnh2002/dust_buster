import 'package:dust_buster/app/modules/notification/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../home/exports.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 15.w),
            Text(
              Strings.notification,
              style: AppTextStyle.titleBodyStyle.copyWith(),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SvgPicture.asset(
              AppImages.iconClean,
              width: 24.w,
              height: 24.h,
              color: AppColors.kGray500Color,
            ),
          ),
          SizedBox(width: 27.w),
        ],
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: TabBar(
              controller: controller.tabController,
              tabs: [
                Tab(
                  text: "Tin nhắn",
                ),
                Tab(
                  text: "Lịch làm việc",
                ),
                Tab(
                  text: "Công ty",
                ),
                Tab(
                  text: "khuyến mãi",
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  Center(child: const Text('Tin nhắn')),
                  Center(child: const Text('Lịch làm việc')),
                  Center(child: const Text('Công ty')),
                  Center(child: const Text('Khuyến mãi')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
