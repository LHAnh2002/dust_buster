import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderStatus extends StatelessWidget {
  final String status;
  const OrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7.5).r,
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.kGray100Color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
            height: 16.h,
            child: SvgPicture.asset(
              AppImages.iconAccessTime,
              fit: BoxFit.cover,
              color: AppColors.kGray500Color,
            ),
          ),
          SizedBox(width: 4.w, height: 0.0),
          Text(
            status,
            style: AppTextStyle.textbodyStyle.copyWith(
              color: AppColors.kGray500Color,
            ),
          ),
        ],
      ),
    );
  }
}
