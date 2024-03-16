import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/login/view/widgets/text_form_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CleaningHoursPage extends GetView<CleaningController> {
  const CleaningHoursPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = Get.arguments;
    
    if (data != null) {
      final String? id = data["id"];
      final String? idL = data["idL"];
      final String? location2 = data["location2"];
      final String? nameSV = data["nameSV"];
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: Icon(
            Ionicons.arrow_back_outline,
            size: 24.sp,
          ),
        ),
        title: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.selectedIndex.value != 2)
                Text(
                  'Dọn dẹp nhà theo giờ',
                  style: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
              if (controller.selectedIndex.value != 2)
                Text(
                  'Xóm 4',
                  style: AppTextStyle.textxsmallStyle,
                ),
              if (controller.selectedIndex.value == 2)
                Text(
                  'Xác thực và thanh toán',
                  style: AppTextStyle.textButtonStyle
                      .copyWith(color: AppColors.kGray1000Color),
                ),
            ],
          ),
        ),
        actions: [
          Obx(() {
            if (controller.selectedIndex.value != 2) {
              return Column(
                children: [
                  ButtonWidget(
                    onTap: () {
                      goPresent(
                        children: [
                          const DescriptionService(),
                        ],
                      );
                    },
                    widget: SvgPicture.asset(
                      AppImages.iconErrorWarning,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                  SizedBox(width: 50.w, height: 0.0),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16).r,
                    child: Column(
                      children: <Widget>[
                        const LocationServiceWidget(),
                        TimePage(controller: controller),
                        OtherOptionsPage(controller: controller),
                        SizedBox(width: 0.0, height: 8.h),
                        Obx(() {
                          if (controller.isPet.value == true) {
                            return TextFormWidget(
                              height: 93.h,
                              controller: controller.textPetEditingController,
                              hintText: 'Nhập ghi chú về vật nuôi...',
                              textInputType: TextInputType.text,
                              obscureText: false.obs,
                              togglePasswordVisibility: () {},
                              showButton: false,
                              onChanged: (value) {},
                              maxLines: 3,
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        })
                      ],
                    ),
                  ),
                ),
                Time2Page(controller: controller),
                WorkDetails(controller: controller),
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              width: 375.w,
              height: controller.selectedIndex.value == 2 ? 121.h : 110.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                    child: TabBar(
                      onTap: (index) {
                        controller.selectTab(index);
                      },
                      isScrollable: false,
                      controller: controller.tabController,
                      labelPadding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding: EdgeInsets.zero,
                      unselectedLabelColor: AppColors.kGrayTextColor,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      indicator: const BoxDecoration(),
                      tabs: [
                        _buildTab(0),
                        _buildTab(1),
                        _buildTab(2),
                      ],
                    ),
                  ),
                  controller.selectedIndex.value == 2
                      ? Container(
                          width: 375.w,
                          height: controller.selectedIndex.value == 2
                              ? 116.h
                              : 74.h,
                          padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 8)
                              .r,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Tổng cộng',
                                    style: AppTextStyle.textsmallStyle60016,
                                  ),
                                  Text(
                                    '${Utils.formatNumber(250000)}đ',
                                    style: AppTextStyle.largeBodyStyle,
                                  ),
                                ],
                              ),
                              ButtonWidget(
                                onTap: () {},
                                text: 'Đăng việc',
                                height: 48.h,
                                colorBackGroud: AppColors.kButtonColor,
                              )
                            ],
                          ),
                        )
                      : Container(
                          width: 375.w,
                          height: 74.h,
                          padding: const EdgeInsets.only(
                                  top: 16, left: 16, right: 16, bottom: 8)
                              .r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Utils.formatNumber(250000)}đ',
                                    style: AppTextStyle.largeBodyStyle,
                                  ),
                                  Text(
                                    '85 m2 / 3 phòng',
                                    style: AppTextStyle.textsmallStyle.copyWith(
                                        color: AppColors.kGray500Color,
                                        fontFamily: 'PlusJakartaSans'),
                                  )
                                ],
                              ),
                              ButtonWidget(
                                onTap: () {
                                  final int nextTabIndex =
                                      (controller.selectedIndex.value + 1) % 3;
                                  controller.selectTab(nextTabIndex);
                                  controller.onTabIndexChanged(nextTabIndex);
                                },
                                text: 'Tiếp tục',
                                width: 120.w,
                                height: 48.h,
                                colorBackGroud: AppColors.kButtonColor,
                              )
                            ],
                          ),
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(int index) {
    return Tab(
      child: controller.selectedIndex >= index
          ? Container(
              width: 123.w,
              height: 4.h,
              color: AppColors.black,
            )
          : Container(
              width: 123.w,
              height: 4.h,
              color: AppColors.kGray200Color,
            ),
    );
  }
}
