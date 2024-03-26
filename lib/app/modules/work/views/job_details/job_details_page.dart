import 'package:dust_buster/app/common/util/navigator.dart';
import 'package:dust_buster/app/common/util/utils.dart';
import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/modules/work/exports.dart';

import '../../../home/exports.dart';
import '../widgets/cancel_job_widget.dart';

class JobDetailsPage extends GetView<JobDetailsController> {
  const JobDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PendingInvoices? model = Get.arguments as PendingInvoices?;

    return Scaffold(
      backgroundColor: AppColors.kGray050Color,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              AppImages.iconBack,
              height: 24.h,
              width: 24.w,
            ),
          ),
          SizedBox(width: 16.w)
        ],
        title: Center(
          child: Text(
            Utils.getLabel(int.parse(model!.label.toString())),
            style:
                AppTextStyle.textButtonStyle.copyWith(color: AppColors.black),
          ),
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          SizedBox(width: 0.0, height: 8.h),
          JobAcceptanceStatus(
            id: model.idPT?.toString() ?? '',
            name: model.namePT?.toString() ?? '',
            oneStar: int.tryParse(model.oneStar?.toString() ?? '0') ?? 0,
            twoStar: int.tryParse(model.twoStar?.toString() ?? '0') ?? 0,
            threeStar: int.tryParse(model.threeStar?.toString() ?? '0') ?? 0,
            fourStar: int.tryParse(model.fourStar?.toString() ?? '0') ?? 0,
            fiveStar: int.tryParse(model.fiveStar?.toString() ?? '0') ?? 0,
            image: model.imagePT?.toString() ?? '',
          ),
          if (model.partner![0].idP != null)
            Column(
              children: [
                SizedBox(width: 0.0, height: 8.h),
                PriorityList(model: model.partner ?? []),
              ],
            ),
          SizedBox(width: 0.0, height: 8.h),
          WorkplaceInformation(model: model),
          SizedBox(width: 0.0, height: 8.h),
          JobDetailss(model: model),
          SizedBox(width: 0.0, height: 8.h),
          PaymentMethods(model: model),
          Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
              children: [
                ButtonWidget(
                  onTap: () {},
                  text: 'Thay đổi yêu cầu',
                  colorBackGroud: AppColors.white,
                  boder: true.obs,
                  textStyle: AppTextStyle.textButtonStyle.copyWith(
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: 0.0, height: 8.h),
                ButtonWidget(
                  onTap: () {
                    controller.formatTime(
                        model.workingDay.toString(), model.workTime.toString());
                    goPresent(children: [
                      CancelJobWidget(
                        controller: controller,
                      ),
                    ]);
                  },
                  text: 'Huỷ việc',
                  colorBackGroud: AppColors.kGray050Color,
                  textStyle: AppTextStyle.textButtonStyle.copyWith(
                    color: AppColors.kRrror400Color,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
