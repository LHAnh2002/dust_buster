import '../../exports.dart';

class DiscoverWidget extends StatelessWidget {
  const DiscoverWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 15, // Khoảng cách giữa các hình ảnh
        runSpacing: 10.0, // Khoảng cách giữa các dòng
        children: List.generate(
          6, // Số lượng hình ảnh, bao gồm cả hình ảnh cuối cùng
          (index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: SizedBox(
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9).r,
                      ),
                      child: Image.asset(
                        "assets/images/hinh_anh.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      textAlign: TextAlign.center,
                      'Giúp Việc Theo Giờ',
                      style: AppTextStyle.semiBoldStyle.copyWith(
                        color: Colors.black,
                        fontSize: 10.5.sp,
                      ),
                    ),
                    Text(
                      '(Ca lẻ)',
                      style: AppTextStyle.buttonTextStyle.copyWith(
                        color: AppColors.kOrangeColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
