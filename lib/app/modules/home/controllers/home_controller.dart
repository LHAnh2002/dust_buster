import 'package:url_launcher/url_launcher.dart';

import '../exports.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  static HomeController instance = Get.find();
  RxList<SlideModel> carouselItemList =
      List<SlideModel>.empty(growable: true).obs;

  RxBool isLoading = false.obs;
  var currentIndex = 0.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  late TabController tabController;

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    getData();
  }

  void getData() async {
    try {
      isLoading(true);
      var result = await SlideService().getBannersFromJson();
      carouselItemList.assignAll(result);
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
