import '../../exports.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 10, // Khoảng cách giữa các hình ảnh
        runSpacing: 10.0, // Khoảng cách giữa các dòng
        children: List.generate(
          6, // Số lượng hình ảnh, bao gồm cả hình ảnh cuối cùng
          (index) {
            if (index < 5) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Stack(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(9).r,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.kBlueLight.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(2, 0),
                                ),
                                BoxShadow(
                                  color: AppColors.kPurpleColorLight
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(3, 3),
                                ),
                              ],
                            ),
                            child: Icon(
                              Ionicons.home_outline,
                              size: 30.sp,
                              color: AppColors.kPurpleColorLight,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            textAlign: TextAlign.center,
                            'Giúp Việc Theo Giờ',
                            style: AppTextStyle.semiBoldStyle.copyWith(
                              color: Colors.black,
                              fontSize: 10.5.sp,
                            ),
                          ),
                          if (index == 2)
                            Text(
                              '(Ca lẻ)',
                              style: AppTextStyle.buttonTextStyle.copyWith(
                                color: AppColors.kOrangeColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 7.h,
                      left: 65.w,
                      child: Container(
                        alignment: Alignment.center,
                        width: 30.w,
                        height: 15.h,
                        decoration: BoxDecoration(
                          color: AppColors.kOrangeColor,
                          borderRadius: BorderRadius.circular(8).r,
                        ),
                        child: Text(
                          'New',
                          style:
                              AppTextStyle.bodySmallDescriptionStyle.copyWith(
                            color: Colors.white,
                            fontSize: 10.5.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              // Trường hợp hiển thị item cuối cùng
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  // Xử lý khi nhấn vào item cuối cùng
                },
                child: SizedBox(
                  width: 100.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // width: double.infinity,
                        height: 55.h,
                        width: 55.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4).r,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppColors.kPurpleColorLight.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(2, 0),
                            ),
                            BoxShadow(
                              color:
                                  AppColors.kPurpleColorLight.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                        // child: SvgPicture.asset(
                        //   "assets/icons/all.svg",
                        //   width: 1.w,
                        //   height: 1.h,
                        //   color: AppColors.kPurpleColorLight,
                        // ),
                        child: Icon(
                          Ionicons.apps_outline,
                          size: 30.sp,
                          color: AppColors.kPurpleColorLight,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Xem thêm',
                        style: AppTextStyle.semiBoldStyle.copyWith(
                          color: Colors.black,
                          fontSize: 10.5.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
