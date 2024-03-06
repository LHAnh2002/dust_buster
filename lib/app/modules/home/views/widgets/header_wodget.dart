import '../../../navigation_bar/exports.dart';
import '../../exports.dart';

class HeaderWodget extends StatelessWidget {
  final String name;
  final String money;
  final String coin;
  final VoidCallback onTap;
  final String image;
  const HeaderWodget(
      {Key? key,
      required this.name,
      required this.money,
      required this.coin,
      required this.onTap,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 189.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 60,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '${Strings.hi} $name,',
                style: AppTextStyle.titleStyle.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 110.h,
            child: InkWell(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7)
                          .r,
                      height: 55.h,
                      width: screenSize.width * 0.46,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(190, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(10).r,
                          bottomLeft: const Radius.circular(10).r,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Strings.surplus,
                                style:
                                    AppTextStyle.textDescriptionStyle.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                '$money đ',
                                style:
                                    AppTextStyle.textDescriptionStyle.copyWith(
                                  color: AppColors.kOrangeColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                          Icon(
                            Ionicons.card_outline,
                            size: 25.sp,
                            color: AppColors.kOrangeColor,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 3.w, height: 0.0),
                    InkWell(
                      onTap: () {
                        NavigationBarController _controller = Get.find();
                        _controller.selecteIndex.value = 2;
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 7)
                            .r,
                        height: 55.h,
                        width: screenSize.width * 0.46,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(190, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(10).r,
                            bottomRight: const Radius.circular(10).r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.rewardPoints,
                                  style: AppTextStyle.textDescriptionStyle
                                      .copyWith(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  '$coin ${Strings.gCoins}',
                                  style: AppTextStyle.textDescriptionStyle
                                      .copyWith(
                                    color: AppColors.kOrangeColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Ionicons.diamond_outline,
                              size: 25.sp,
                              color: AppColors.kOrangeColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
