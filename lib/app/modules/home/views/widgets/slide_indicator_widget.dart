import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../exports.dart';

class SlideWithIndicator extends StatelessWidget {
  final HomeController controller;

  final List<SlideModel> data;

  const SlideWithIndicator({
    Key? key,
    required this.data,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: data
              .map((item) => InkWell(
                    onTap: () async {
                      await controller.launchURL(item.link);
                      debugPrint("Click ${item.link}");
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 14).r,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: item.image,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      Shimmer.fromColors(
                                highlightColor: Colors.white,
                                baseColor: Colors.grey.shade300,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Container(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
            enlargeFactor: 0.23,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 25 / 9,
            viewportFraction: 0.83,
            onPageChanged: (index, reason) {
              controller.onPageChanged(index);
            },
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: data.asMap().entries.map(
              (entry) {
                int index = entry.key;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: controller.currentIndex.value == index ? 17.w : 4.5.w,
                  height: 4.5.h,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0).r,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    color: controller.currentIndex.value == index
                        ? const Color.fromRGBO(0, 0, 0, 0.9)
                        : const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
