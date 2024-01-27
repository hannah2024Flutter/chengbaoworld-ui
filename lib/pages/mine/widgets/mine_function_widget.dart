import 'package:castleworld/config/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：

class MineFunctionWidget extends StatelessWidget {
  const MineFunctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Color(0xffffffff),
          Color(0xfff3f9ff),
        ]),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      padding: EdgeInsets.only(top: 13.h, bottom: 15.h),
      margin: EdgeInsets.only(top: 20.h),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          _getMineActionItem('ic_mine_action_invite', '邀请好友', () {
            //todo
          }),
          _getMineActionItem('ic_mine_action_auth', '实名认证', () {
            //todo
          }),
          _getMineActionItem('ic_mine_action_manager', '店长中心', () {
            //todo
          }),
          _getMineActionItem('ic_mine_action_help', '帮助中心', () {
            //todo
          }),
        ],
      ),
    );
  }

  Widget _getMineActionItem(String img, String text, Function function) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: function.call(),
        child: Column(
          children: [
            Image.asset(
              getImgPath(img),
              fit: BoxFit.fill,
              width: 28.w,
              height: 31.h,
            ),
            SizedBox(height: 8.h),
            Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff333333),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
