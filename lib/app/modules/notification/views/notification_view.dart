import 'package:dust_buster/app/modules/notification/exports.dart';
import 'package:dust_buster/app/modules/notification/views/widgets/notification_widget.dart';
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
          SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: Obx(() => TabBar(
                  onTap: (index) {
                    controller.selectTab(index);
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  isScrollable: true,
                  controller: controller.tabController,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 4).r,
                  physics: const NeverScrollableScrollPhysics(),
                  dividerHeight: 0.r,
                  padding: const EdgeInsets.only(top: 16, bottom: 16).r,
                  unselectedLabelColor: AppColors.kGrayTextColor,
                  indicatorSize: TabBarIndicatorSize.values.last,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 3).r,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(48).r,
                    color: AppColors.kGray1000Color,
                  ),
                  labelColor: AppColors.white,
                  tabs: [
                    _buildTab(Strings.texting, 0),
                    _buildTab(Strings.calendar, 1),
                    _buildTab(Strings.company, 2),
                    _buildTab(Strings.promotion, 3),
                  ],
                )),
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                NotificationWidget(
                  label: 0,
                  title: 'Ngô Vũ Thủy Tiên',
                  content: 'Công việc đã hoàn thành chị nhé',
                  image: AppImages.iconAvtTest,
                ),
                NotificationWidget(
                  label: 1,
                  title: 'Lịch dọn dẹp nhà',
                  content: 'Gói dọn dẹp nhà Premium',
                  image: AppImages.iconJob,
                  color: AppColors.kButtonColor,
                ),
                NotificationWidget(
                  label: 1,
                  title: 'Thay đổi chính sách',
                  content: 'Thay đổi chính sách sử dụng',
                  image: AppImages.iconCompany,
                  color: AppColors.kBlue500Color,
                ),
                NotificationWidget(
                  label: 1,
                  title: 'Giảm 25% các dịch vụ',
                  content: 'Giảm giá tất cả các dịch vụ từ a sang b',
                  image: AppImages.iconPromotion,
                  color: AppColors.kYellowColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  } // Hàm tạo tab

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(48).r,
          border: Border.all(
            color: controller.selectedIndex != index
                ? AppColors.kGrayTextColor
                : Colors.transparent,
            width: controller.selectedIndex != index ? 1.w : 0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Dimens.fontSize14,
                fontFamily: "SFProText",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
