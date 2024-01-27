import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/mine/my_social_info_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：

class MineCenterWidget extends StatelessWidget {
  const MineCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          _getMineCenterItemWidget('bg_mine_store', '我的仓库', '边赚边玩', () {
            Get.toNamed(AppRoutes.myStore);
          }),
          SizedBox(width: 13.w),
          _getMineCenterItemWidget(
            'bg_mine_transfer',
            '转赠中心',
            '领腾讯VIP',
            () {
              //todo
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                barrierColor: const Color(0xb3000000),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const MySocialInfoDialog();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getMineCenterItemWidget(
    String img,
    String title,
    String content,
    Function function,
  ) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          function.call();
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              getImgPath(img),
              fit: BoxFit.fill,
              width: double.infinity,
              height: 82.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xffffffff),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
