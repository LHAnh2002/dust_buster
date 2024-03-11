import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/util/exports.dart';

class ButtonAvartarWidget extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonAvartarWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 25).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Container(
                  width: 88.w,
                  height: 88.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.kPurplePurpleColor,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0).r,
                    child: SvgPicture.asset(
                      AppImages.iconVector,
                      height: 88.h,
                      width: 88.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15.w, height: 0.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'LHAnh',
                      style: AppTextStyle.buttonTextStyle.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'Chỉnh sửa tài khoản',
                      style: AppTextStyle.buttonTextStyle.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.edit_note_outlined,
              color: AppColors.kOrangeColor,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}
