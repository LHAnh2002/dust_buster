import 'package:dust_buster/app/modules/home/exports.dart';

import '../exports.dart';

class WorkView extends GetView<WorkController> {
  const WorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {},
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Text(
                Strings.history,
                style: AppTextStyle.bodySmall14Style.copyWith(
                  color: AppColors.kOrangeColor,
                  fontSize: 13.sp,
                ),
              ),
            ),
            SizedBox(width: 30.w),
          ],
          title: Row(
            children: [
              SizedBox(width: 15.w),
              Text(
                Strings.work,
                style: AppTextStyle.textButtonSmallStyle.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.white,
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            indicatorColor: AppColors.kOrangeColor,
            labelColor: AppColors.kOrangeColor,
            tabs: [
              Tab(
                text: Strings.waitToDo,
              ),
              Tab(
                text: Strings.repeat,
              ),
              Tab(
                text: Strings.accordingToThePackage,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WaitingWidget(),
            WaitingWidget(),
            WaitingWidget(),
          ],
        ),
      ),
    );
  }
}
