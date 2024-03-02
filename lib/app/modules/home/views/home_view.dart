import '../exports.dart';
export 'package:flutter/material.dart';
export 'package:get/get.dart';
export 'package:ionicons/ionicons.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        Text("Data not found!")
                      ],
                    ),
                  );
                }
              }
            },
          ),
          SizedBox(height: 10.h),
          const Align(
            child: ServiceWidget(),
          ),
          const Divider(
            color: Color.fromARGB(25, 0, 0, 0),
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
            child: DefaultTabController(
              length: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Khám phá',
                    style: AppTextStyle.semiBoldMediumStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.5.sp,
                    ),
                  ),
                  TabBar(
                    // isScrollable: true,
                    labelColor: AppColors.kOrangeColor,
                    indicatorColor: AppColors.kOrangeColor,
                    controller: controller.tabController,
                    tabs: const [
                      Tab(
                        text: 'Ưu đãi đặc biệt',
                      ),
                      Tab(
                        text: 'Tin Tức',
                      ),
                      Tab(
                        text: '#Guvilover',
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.maxFinite,
                    height: 1200,
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            spacing: 15, // Khoảng cách giữa các hình ảnh
                            runSpacing: 10.0, // Khoảng cách giữa các dòng
                            children: List.generate(
                              6, // Số lượng hình ảnh, bao gồm cả hình ảnh cuối cùng
                              (index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {},
                                  child: SizedBox(
                                    width: 150.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 150.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(9).r,
                                          ),
                                          child: Image.asset(
                                            "assets/images/hinh_anh.jpeg",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Text(
                                          textAlign: TextAlign.center,
                                          'Giúp Việc Theo Giờ',
                                          style: AppTextStyle.semiBoldStyle
                                              .copyWith(
                                            color: Colors.black,
                                            fontSize: 10.5.sp,
                                          ),
                                        ),
                                        Text(
                                          '(Ca lẻ)',
                                          style: AppTextStyle.buttonTextStyle
                                              .copyWith(
                                            color: AppColors.kOrangeColor,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        // DiscoverWidget(),
                        DiscoverWidget(),
                        DiscoverWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
