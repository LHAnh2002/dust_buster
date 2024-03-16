import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CleaningController extends GetxController
    with SingleGetTickerProviderMixin {
  final TextEditingController textPetEditingController =
      TextEditingController();
  final TextEditingController textEmployeeNotesEditingController =
      TextEditingController();
  DateTime now = DateTime.now();
  var dateTime = DateTime.now().obs;
  var selectedTimeOption = 0.obs;
  var selectedIndex = 0.obs;
  var isFavoriteMaker = true.obs;
  var isPet = false.obs;
  var isRepeatWeekly = false.obs;

  var selectedDateIndex = 0.obs;

  var selectedMoney = 0.obs;
  var selectedPaymentMethod = 'Ví 3CleanPay'.obs;
  List<String> paymentMethods = ['Ví 3CleanPay', 'Tiền mặt'];
  late RxString selectedDate =
      'Hôm nay, ${DateFormat('dd/MM/yyyy').format(now)}'.obs;

  late TabController tabController;
  RxList<bool> isSelectedList = List.generate(7, (index) => false).obs;

  void selectFirstDayOption(int index) {
    isSelectedList[index] = !isSelectedList[index];
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
    if (method == 'Ví 3CleanPay') {
      selectedMoney.value = 100000;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    selectedMoney.value = 100000;
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void selectTab(int index) {
    selectedIndex.value = index;
  }

  void selectTimeOption(int option) {
    selectedTimeOption.value = option;
  }

  void selectdDateIndex(int option) {
    selectedDateIndex.value = option;
  }

  void onTabIndexChanged(int index) {
    tabController.animateTo(index);
  }

  List<String> generateWeekDates() {
    List<String> weekDates = [];

    // Add today's date with the sign
    weekDates.add('Hôm nay, ${DateFormat('dd/MM/yyyy').format(now)}');

    // Add dates for the next 6 days with signs
    for (int i = 1; i <= 6; i++) {
      DateTime nextDay = now.add(Duration(days: i));
      String sign = _getDaySign(nextDay.weekday);
      weekDates.add('$sign, ${DateFormat('dd/MM/yyyy').format(nextDay)}');
    }

    return weekDates;
  }

  String _getDaySign(int dayOfWeek) {
    switch (dayOfWeek) {
      case DateTime.monday:
        return 'Thứ 2';
      case DateTime.tuesday:
        return 'Thứ 3';
      case DateTime.wednesday:
        return 'Thứ 4';
      case DateTime.thursday:
        return 'Thứ 5';
      case DateTime.friday:
        return 'Thứ 6';
      case DateTime.saturday:
        return 'Thứ 7';
      case DateTime.sunday:
        return 'CN';
      default:
        return '';
    }
  }
}
