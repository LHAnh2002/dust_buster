import 'package:dust_buster/app/data/models/pending_invoices_models/pending_invoices.dart';
import 'package:dust_buster/app/data/repository/api_helper.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:intl/intl.dart';

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

  String getLabel(int label) {
    if (label == 1) {
      return "Dọn dẹp nhà theo giờ";
    } else if (label == 2) {
    } else if (label == 3) {
    } else if (label == 4) {
    } else if (label == 5) {
    } else if (label == 6) {
    } else if (label == 7) {}
    return "Unknown label";
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

  String formatTimeAgo(String time) {
    DateTime dateTime = DateTime.parse(time);

    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} giây trước';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays < 5) {
      return '${difference.inDays} ngày trước';
    } else {
      // Format the DateTime object using intl library
      final formatter = DateFormat('dd/MM/yyyy HH:mm');
      return formatter.format(dateTime);
    }
  }
}
