import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';

class WaitingController extends GetxController
    with StateMixin<List<PendingInvoices>> {
  final ApiHelper _apiHelper = Get.find();

  List<PendingInvoices> listPendingInvoices = [];

  var textLabel = "".obs;
  var hasRepeatStateOne = false.obs;

  @override
  void onInit() {
    getPendingInvoicee();
    super.onInit();
  }

  Future<void> getPendingInvoicee() async {
    try {
      change(null, status: RxStatus.loading());

      final response = await _apiHelper.getPendingInvoice();
      if (response['status'] == "OK") {
        if (response['pending_invoices'] != null) {
          final List<PendingInvoices> pendingInvoices =
              (response['pending_invoices'] as List)
                  .map((json) => PendingInvoices.fromJson(json))
                  .toList();

          if (pendingInvoices.isNotEmpty) {
            listPendingInvoices = pendingInvoices;
            change(pendingInvoices, status: RxStatus.success());
            return;
          }
        }
        change(null, status: RxStatus.empty());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      // If an error occurs, set status to error
      debugPrint('Error in getPendingInvoicee: $e');
      change(null, status: RxStatus.error());
    }
  }



  String getStatus(int label) {
    if (label == 0) {
      return "Chờ nhận việc";
    } else if (label == 1) {
      return "Chờ xác nhận";
    } else if (label == 2) {
      return "Đã nhận";
    } else if (label == 3) {
      return "Hoàn thành";
    }
    return "Unknown label";
  }
  
}
