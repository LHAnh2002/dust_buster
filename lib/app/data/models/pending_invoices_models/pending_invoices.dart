import 'package:dust_buster/app/data/models/pending_invoices_models/partner.dart';

class PendingInvoices {
  String? idIV;
  String? idPT;
  int? label;
  String? imagePT;
  String? namePT;
  String? postingTime;
  String? workingDay;
  String? workTime;
  String? repeat;
  String? location;
  int? price;
  String? petNotes;
  String? employeeNotes;
  int? orderStatus;
  int? invoiceStatus;
  int? paymentMethods;
  int? repeatState;
  List<Partner>? partner;

  PendingInvoices(
      {this.idIV,
      this.idPT,
      this.label,
      this.imagePT,
      this.namePT,
      this.postingTime,
      this.workingDay,
      this.workTime,
      this.repeat,
      this.location,
      this.price,
      this.petNotes,
      this.employeeNotes,
      this.orderStatus,
      this.invoiceStatus,
      this.repeatState,
      this.paymentMethods,
      this.partner});

  PendingInvoices.fromJson(Map<String, dynamic> json) {
    idIV = json['idIV'];
    idPT = json['idPT'];
    label = json['label'];
    imagePT = json['imagePT'];
    namePT = json['namePT'];
    postingTime = json['posting_time'];
    workingDay = json['working_day'];
    workTime = json['work_time'];
    repeat = json['repeat'];
    location = json['location'];
    price = json['price'];
    petNotes = json['pet_notes'];
    employeeNotes = json['employee_notes'];
    orderStatus = json['order_status'];
    invoiceStatus = json['invoice_status'];
    repeatState = json['repeat_state'];
    paymentMethods = json['payment_methods'];
    if (json['partner'] != null) {
      partner = <Partner>[];
      json['partner'].forEach((v) {
        partner!.add(new Partner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idIV'] = this.idIV;
    data['idPT'] = this.idPT;
    data['label'] = this.label;
    data['imagePT'] = this.imagePT;
    data['namePT'] = this.namePT;
    data['posting_time'] = this.postingTime;
    data['working_day'] = this.workingDay;
    data['work_time'] = this.workTime;
    data['repeat'] = this.repeat;
    data['location'] = this.location;
    data['price'] = this.price;
    data['pet_notes'] = this.petNotes;
    data['employee_notes'] = this.employeeNotes;
    data['order_status'] = this.orderStatus;
    data['invoice_status'] = this.invoiceStatus;
    data['repeat_state'] = this.repeatState;
    data['payment_methods'] = this.paymentMethods;
    if (this.partner != null) {
      data['partner'] = this.partner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
