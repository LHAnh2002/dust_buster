import '../../../routes/app_pages.dart';
import '../exports.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:ionicons/ionicons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchCurrentLocation();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Container(
          width: double.infinity,
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderView(
                onTapLocation: () {
                  Get.toNamed(Routes.location);
                },
                onTapPoints: () {},
                onTapWallet: () {},
                name: 'LHAnh',
                location: Strings.myLocation,
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: SlideLoading(),
                    );
                  } else {
                    if (controller.carouselItemList.isNotEmpty) {
                      return SlideWithIndicator(
                        data: controller.carouselItemList,
                        controller: Get.put(HomeController()),
                      );
                    } else {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.hourglass_empty),
                            Text("Dữ liệu không tồn tại!")
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
              SizedBox(width: 0.0, height: 26.h),
              const ServiceView(),
              SizedBox(width: 0.0, height: 16.h),
              EndowBlogWidget(
                name: Strings.endow,
                label: 1,
                onTapSeeMore: () {},
              ),
              EndowBlogWidget(
                name: 'Blog',
                label: 2,
                onTapSeeMore: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
