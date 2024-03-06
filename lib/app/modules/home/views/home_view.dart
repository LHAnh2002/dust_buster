import 'package:dust_buster/app/modules/widgets/button_all_widget.dart';

import '../exports.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:ionicons/ionicons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            controller.handleScroll(notification.metrics.pixels);
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderWodget(
                name: 'LHAnh',
                coin: '0',
                money: '0',
                onTap: () {},
                image: "assets/images/bacnkgroud.jpeg",
              ),
              // Obx(
              //   () {
              //     if (controller.isLoading.value) {
              //       return const Center(
              //         child: SlideLoading(),
              //       );
              //     } else {
              //       if (controller.carouselItemList.isNotEmpty) {
              //         return SlideWithIndicator(
              //           data: controller.carouselItemList,
              //           controller: Get.put(HomeController()),
              //         );
              //       } else {
              //         return const Center(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               Icon(Icons.hourglass_empty),
              //               Text("Data not found!")
              //             ],
              //           ),
              //         );
              //       }
              //     }
              //   },
              // ),
              SizedBox(height: 10.h),
              const Align(
                child: ServiceWidget(),
              ),
              const Divider(
                color: Color.fromARGB(25, 0, 0, 0),
                thickness: 1.5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ButtonAllWidget(
                      onTap: () {},
                      text: Strings.specialOffers,
                    ),
                    const EndowWidget(),
                    const Divider(
                      color: Color.fromARGB(25, 0, 0, 0),
                      thickness: 1.5,
                    ),
                    ButtonAllWidget(
                      onTap: () {},
                      text: Strings.news,
                    ),
                    const NewsWidget(),
                    const Divider(
                      color: Color.fromARGB(25, 0, 0, 0),
                      thickness: 1.5,
                    ),
                    ButtonAllWidget(
                      onTap: () {},
                      text: Strings.applover,
                    ),
                    const NewsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.isVisible.value,
          child: InkWell(
            onTap: () {
              controller.isScrollingToTop.value =
                  true; // Thiết lập biến là true khi bắt đầu cuộn lên đầu trang
              controller.scrollController
                  .animateTo(
                0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              )
                  .then((_) {
                // Sau khi cuộn lên đầu trang xong, reset lại giá trị của biến
                controller.isVisible.value = false;
                controller.isScrollingToTop.value = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5).r,
              width: 110.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7).r,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.1),
                      blurRadius: 7.r,
                    ),
                  ]),
              child: Row(
                children: [
                  Icon(
                    Ionicons.chevron_up_outline,
                    color: AppColors.kOrangeColor,
                    size: 16.sp,
                  ),
                  SizedBox(width: 3.w, height: 0.0),
                  Text(
                    'Lên đầu trang',
                    style: AppTextStyle.semiBoldMediumStyle.copyWith(
                      color: AppColors.kOrangeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
