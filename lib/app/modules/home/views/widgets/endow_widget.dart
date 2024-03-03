import '../../exports.dart';

class EndowWidget extends StatelessWidget {
  const EndowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: List.generate(
          6,
          (index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/hinh_anh.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      softWrap: true,
                      textAlign: TextAlign.start,
                      '3 Triệu thả ga, ưu đãi 100k',
                      style: AppTextStyle.semiBoldStyle.copyWith(
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Ionicons.calendar_outline,
                          size: 16.sp,
                          color: AppColors.kGreenChart,
                        ),
                        SizedBox(width: 7.w),
                        const Text('01/01')
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
