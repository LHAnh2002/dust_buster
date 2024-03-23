import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:dust_buster/app/modules/work/views/empt/empt_work.dart';
import 'package:dust_buster/app/modules/work/views/loading/work_loading.dart';
import 'package:dust_buster/app/modules/work/views/waitings/waitings_widget.dart';
import '../../exports.dart';

class WaitingPage extends GetView<WaitingController> {
  const WaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: RefreshIndicator(
        onRefresh: () => controller.getPendingInvoicee(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16).r,
          child: ListView(
            children: [
              controller.obx(
                (state) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final PendingInvoices? model =
                          state![index] as PendingInvoices?;

                      return WaitingsWidget(
                        lable: controller.getLabel(model!.label!),
                        time: controller.formatTimeAgo(model.postingTime!),
                        workingDay: model.workingDay!,
                        repeat: model.repeat!,
                        price: '${Utils.formatNumber(model.price!)}đ',
                        location: model.location!,
                        employeeNotes: model.employeeNotes!,
                        petNotes: model.petNotes!,
                        workTime: model.workTime!,
                        status: controller.getStatus(model.orderStatus!),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: 0.0, height: 8.h),
                  );
                },
                onLoading: const WorkLoading(),
                onEmpty: Padding(
                    padding: const EdgeInsets.only(top: 200).r,
                    child: const EmptWork()),
                onError: (error) => Center(
                    child: CustomNotFoundWidget(error: error, top: 0.18.sh)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
