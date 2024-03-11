import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/home/views/home_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../exports.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 15.w),
            Text(
              Strings.work,
              style: AppTextStyle.largeBodyStyle.copyWith(
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: (() {}),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12).r,
              width: 96.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: AppColors.kWarning100Color,
                borderRadius: BorderRadius.circular(16).r,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    child: SvgPicture.asset(
                      AppImages.iconAccessTime,
                      color: AppColors.kWarning700Color,
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  SizedBox(width: 6.w, height: 0.0),
                  Text(
                    Strings.history,
                    style: AppTextStyle.largeBodyStyle.copyWith(
                        fontSize: 14.sp, color: AppColors.kWarning700Color),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 30.w),
        ],
        backgroundColor: AppColors.white,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 64.h,
                color: AppColors.white,
                child: Obx(
                  () => TabBar(
                    onTap: (index) {
                      controller.selectTab(index);
                    },
                    labelPadding: EdgeInsets.zero,
                    // physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 16)
                        .r,
                    unselectedLabelColor: AppColors.kGrayTextColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 1).r,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(48).r,
                      color: AppColors.kGray1000Color,
                    ),
                    
                    labelColor: AppColors.white,
                    tabs: [
                      Tab(
                        child: Container(
                          width: 109.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48).r,
                            border: Border.all(
                              // ignore: unrelated_type_equality_checks
                              color: controller.selectedIndex != 0
                                  ? AppColors.kGrayTextColor
                                  : Colors.transparent,
                              width:
                                  // ignore: unrelated_type_equality_checks
                                  controller.selectedIndex != 0 ? 1.w : 0,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Chờ làm",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dimens.fontSize14,
                                  fontFamily: "SFProText"),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 32.h,
                          width: 109.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48).r,
                            border: Border.all(
                              // ignore: unrelated_type_equality_checks
                              color: controller.selectedIndex != 1
                                  ? AppColors.kGrayTextColor
                                  : Colors.transparent,
                              width:
                                  // ignore: unrelated_type_equality_checks
                                  controller.selectedIndex != 1 ? 1.w : 0,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Lặp lại",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dimens.fontSize14,
                                  fontFamily: "SFProText"),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 32.h,
                          width: 109.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48).r,
                            border: Border.all(
                              // ignore: unrelated_type_equality_checks
                              color: controller.selectedIndex != 2
                                  ? AppColors.kGrayTextColor
                                  : Colors.transparent,
                              width:
                                  // ignore: unrelated_type_equality_checks
                                  controller.selectedIndex != 2 ? 1.w : 0,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Theo gói",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dimens.fontSize14,
                                  fontFamily: "SFProText"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  WaitingWidget(),
                  WaitingWidget(),
                  WaitingWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
