import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../exports.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  final ScrollController scrollController = ScrollController();
  RxList<SlideModel> carouselItemList =
      List<SlideModel>.empty(growable: true).obs;
  final double scrollThreshold = 200.0;
  var isVisible = false.obs;
  var isScrollingToTop = false.obs;

  RxBool isLoading = false.obs;
  var showMoreButton = true.obs;
  var currentIndex = 0.obs;
  Position? position;

  var isSevicePermission = false.obs;

  late LocationPermission permission;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    getData();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }

  void handleScroll(double offset) {
    if (offset >= scrollThreshold) {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
  }

  void _scrollListener() {
    if (!isScrollingToTop.value) {
      if (scrollController.offset >= scrollThreshold &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        // Ẩn nút khi người dùng cuộn lên đầu trang
        isVisible.value = false;
      } else {
        // Hiển thị nút khi người dùng cuộn xuống
        if (!isVisible.value) {
          isVisible.value = true;
        }
      }
    }
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

  Future<Position> getCurrentLocation() async {
    isSevicePermission.value = await Geolocator.isLocationServiceEnabled();
    if (!isSevicePermission.value) {
      debugPrint("service disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  void fetchCurrentLocation() async {
    try {
      position = await getCurrentLocation();
    } catch (e) {
      print("Error fetching current location: $e");
    }
  }
}
