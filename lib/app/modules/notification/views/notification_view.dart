import 'package:dust_buster/app/modules/notification/exports.dart';
import 'package:flutter_svg/svg.dart';
import '../../home/exports.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 15.w),
            Text(
              Strings.notification,
              style: AppTextStyle.textButtonSmallStyle.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                Icons.done_all_rounded,
                color: AppColors.black,
                size: 22.sp,
              )),
          SizedBox(width: 27.w),
        ],
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            6,
            (index) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  children: [
                    Container(
                      height: 100.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.kBlackLight2,
                                  width: 1.r,
                                ),
                                borderRadius: BorderRadius.circular(45).r),
                            child: ClipRRect(
                              child: SvgPicture.asset(
                                AppImages.iconComplete,
                                fit: BoxFit.none,
                                color: AppColors.kPurpleColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w, height: 0.0),
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Dịch vụ dúm việc theo giờ',
                                    style: AppTextStyle.textButtonSmallStyle
                                        .copyWith(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Bạn đã đặt thành công dịch vụ giúp việc theo giờ',
                                    overflow: TextOverflow.clip,
                                    style: AppTextStyle.textButtonSmallStyle
                                        .copyWith(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  Text(
                                    '25/11/2023 lúc 14:58',
                                    style: AppTextStyle.textButtonSmallStyle
                                        .copyWith(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: AppColors.kBlackLight1,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
