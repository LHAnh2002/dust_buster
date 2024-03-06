import 'package:dust_buster/app/common/util/exports.dart';
import 'package:dust_buster/app/modules/account/view/widgets/button_endow_widget.dart';
import 'package:dust_buster/app/modules/home/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../exports.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ButtonAvartarWidget(
            onTap: () {
              controller.getLogout();
            },
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Strings.endow,
                    style: AppTextStyle.semiBoldStyle.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 7)
                            .r,
                    child: Column(
                      children: [
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.rewards,
                          widget: Container(
                            alignment: Alignment.center,
                            width: 47.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              color: AppColors.kOrangeColor,
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            child: Text(
                              Strings.sing,
                              style: AppTextStyle.semiBoldStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.introduce,
                          widget: Container(
                            alignment: Alignment.center,
                            width: 47.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              color: AppColors.kOrangeColor,
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                            child: Text(
                              Strings.neww,
                              style: AppTextStyle.semiBoldStyle.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    Strings.myAccount,
                    style: AppTextStyle.semiBoldStyle.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 7)
                            .r,
                    child: Column(
                      children: [
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.myLocation,
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.staffFavorite,
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.restrictedList,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    Strings.generality,
                    style: AppTextStyle.semiBoldStyle.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 7)
                            .r,
                    child: Column(
                      children: [
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.evaluate,
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.helpCenter,
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.termsOfUse,
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.privacyPolicy,
                        ),
                        const Divider(
                          color: AppColors.kBlackLight2,
                          thickness: 0.5,
                        ),
                        ButtonEndowWidget(
                          onTap: () {},
                          text: Strings.setting,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
