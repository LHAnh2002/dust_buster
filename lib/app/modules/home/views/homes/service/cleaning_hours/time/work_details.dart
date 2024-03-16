import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/widgets/custom_svg.dart';
import 'package:dust_buster/app/modules/work/views/widgets/job_details_widget.dart';
import 'package:flutter_svg/svg.dart';

class WorkDetails extends StatelessWidget {
  final CleaningController controller;
  const WorkDetails({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.kGray050Color,
        padding: const EdgeInsets.symmetric(vertical: 8).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 144.h,
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Vị trí làm việc',
                          style: AppTextStyle.textButtonStyle
                              .copyWith(color: AppColors.kGray1000Color),
                        ),
                        ButtonWidget(
                          onTap: () {},
                          widget: Container(
                            height: 24.h,
                            width: 67.w,
                            padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 7)
                                .r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16).r,
                              border:
                                  Border.all(color: AppColors.kGray1000Color),
                            ),
                            child: Text(
                              Strings.change,
                              style: AppTextStyle.textsmallStyle12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  const JobDetailsWidget(
                    image: AppImages.iconMapPin,
                    text:
                        '10 Đường số 5, An hải bắc, sơn trà, đà nẵng, 550000. Việt nam',
                    color: AppColors.kGrayTextFormColor,
                  ),
                  SizedBox(width: 0.0, height: 8.h),
                  const JobDetailsWidget(
                    image: AppImages.iconMapPin,
                    text: 'LHAnh - 0333346071',
                    color: AppColors.kGrayTextFormColor,
                  ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              height: 161.h,
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian làm việc',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  const JobDetailsWidget(
                    image: AppImages.iconDate,
                    color: AppColors.kGray400Color,
                    text: 'Thứ 2, 16/01/2023',
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  const JobDetailsWidget(
                    image: AppImages.iconTime,
                    text: '3 giờ, 10:00 đến 13:00',
                    color: AppColors.kGray400Color,
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  const JobDetailsWidget(
                    image: AppImages.iconRepeat,
                    color: AppColors.kGray400Color,
                    text: 'Thứ 3, Thứ 5, Thứ 7',
                  ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              height: 185.h,
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết công việc',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  const JobDetailsWidget(
                    image: AppImages.iconWork,
                    text: '85 m2 / 3 phòng',
                    color: AppColors.kGray400Color,
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  const JobDetailsWidget(
                    image: AppImages.iconDog,
                    text: 'Nhà có vật nuôi',
                    color: AppColors.kGray400Color,
                  ),
                  SizedBox(width: 0.0, height: 12.h),
                  const JobDetailsWidget(
                    image: AppImages.iconNote,
                    color: AppColors.kGray400Color,
                    text: 'Vui lòng đảm bảo im lặng trong quá trình làm việc.',
                  ),
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tính tiền',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  SizedBox(width: 0.0, height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tạm tính',
                        style: AppTextStyle.textsmallStyle.copyWith(
                          color: AppColors.kGray1000Color,
                        ),
                      ),
                      Text(
                        '${Utils.formatNumber(250000)} đ',
                        style: AppTextStyle.textbodyStyle.copyWith(
                          color: AppColors.kGray1000Color,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 0.0, height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Khuyến mãi',
                        style: AppTextStyle.textsmallStyle.copyWith(
                          color: AppColors.kPurplePurpleColor,
                        ),
                      ),
                      Text(
                        '- ${Utils.formatNumber(250000)} đ',
                        style: AppTextStyle.textbodyStyle.copyWith(
                          color: AppColors.kPurplePurpleColor,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 0.0, height: 8.h),
            Container(
              height: 175.h,
              padding: const EdgeInsets.all(16).r,
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  width: 1.0,
                  color: AppColors.kGray100Color,
                )),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phương thức thanh toán',
                    style: AppTextStyle.textButtonStyle
                        .copyWith(color: AppColors.kGray1000Color),
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () {
                        goPresent(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chọn phương thức thanh toán',
                                style: AppTextStyle.textButtonStyle
                                    .copyWith(color: AppColors.kGray1000Color),
                              ),
                              ButtonWidget(
                                onTap: () {
                                  Get.back();
                                },
                                widget: SvgPicture.asset(
                                  AppImages.iconClose,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                boder: false.obs,
                              )
                            ],
                          ),
                          SizedBox(width: 0.0, height: 16.h),
                          SizedBox(
                            height: 140.h,
                            child: ListView.separated(
                              itemCount: controller.paymentMethods.length,
                              itemBuilder: (context, index) {
                                final method = controller.paymentMethods[index];
                                Color? color =
                                    controller.selectedPaymentMethod.value ==
                                            method
                                        ? AppColors.kGray1000Color
                                        : AppColors.kGray500Color;
                                String image;

                                switch (method) {
                                  case 'Ví 3CleanPay':
                                    image = AppImages.iconWallet;
                                    break;
                                  case 'Tiền mặt':
                                    image = AppImages.iconMoneyDollarBox;
                                    break;

                                  default:
                                    image = AppImages.iconWallet;
                                }
                                return ButtonWidget(
                                  onTap: () {
                                    controller.selectPaymentMethod(method);
                                    Get.back();
                                  },
                                  widget: Container(
                                    height: 56.h,
                                    padding: const EdgeInsets.all(16).r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12).r,
                                      border: Border.all(
                                        color: color,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 24.w,
                                              height: 24.h,
                                              padding:
                                                  const EdgeInsets.all(2).r,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8).r,
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    AppColors
                                                        .kBrightPurpleColor,
                                                    AppColors.kDarkPurpleColor,
                                                  ], // Mặc định gradient
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                              ),
                                              child: CustomSvg(
                                                image: image,
                                                width: 15.w,
                                                color: AppColors.white,
                                                height: 15.h,
                                              ),
                                            ),
                                            SizedBox(width: 10.w, height: 0.0),
                                            Text(
                                              method,
                                              style: AppTextStyle.lableBodyStyle
                                                  .copyWith(
                                                color: color,
                                              ),
                                            ),
                                          ],
                                        ),
                                        CustomSvg(
                                          image: controller
                                                      .selectedPaymentMethod
                                                      .value ==
                                                  method
                                              ? AppImages.iconRadioButtonChecked
                                              : AppImages
                                                  .iconRadioButtonUnchecked,
                                          color: color,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 0.0, height: 8.h),
                            ),
                          ),
                        ]);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  width: 24.w,
                                  height: 24.h,
                                  padding: const EdgeInsets.all(2).r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8).r,
                                    gradient: const LinearGradient(
                                      colors: [
                                        AppColors.kBrightPurpleColor,
                                        AppColors.kDarkPurpleColor,
                                      ], // Mặc định gradient
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: CustomSvg(
                                    image: controller
                                                .selectedPaymentMethod.value ==
                                            "Ví 3CleanPay"
                                        ? AppImages.iconWallet
                                        : AppImages.iconMoneyDollarBox,
                                    width: 15.w,
                                    color: AppColors.white,
                                    height: 15.h,
                                  ),
                                ),
                                SizedBox(width: 8.w, height: 0.0),
                                Text(
                                  controller.selectedPaymentMethod.value,
                                  style: AppTextStyle.textsmallStyle60016,
                                ),
                                SizedBox(width: 4.w, height: 0.0),
                                Text(
                                  '(${controller.selectedPaymentMethod.value == "Ví 3CleanPay" ? Utils.formatNumber(controller.selectedMoney.value) : ''}đ)',
                                  style: AppTextStyle.textsmallStyle60016,
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const SizedBox(width: 0.0, height: 0.0),
                                SizedBox(width: 10.w, height: 0.0),
                                const CustomSvg(
                                  image: AppImages.iconArrowright,
                                  fit: BoxFit.fitHeight,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: 24.w,
                                height: 24.h,
                                padding: const EdgeInsets.all(2).r,
                                child: CustomSvg(
                                  image: AppImages.iconPriceTag3,
                                  width: 15.w,
                                  height: 15.h,
                                  color: AppColors.kGray400Color,
                                ),
                              ),
                              SizedBox(width: 8.w, height: 0.0),
                              Text(
                                'Khuyến mãi',
                                style: AppTextStyle.textsmallStyle60016,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const SizedBox(width: 0.0, height: 0.0),
                              SizedBox(width: 10.w, height: 0.0),
                              const CustomSvg(
                                image: AppImages.iconArrowright,
                                fit: BoxFit.fitHeight,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
