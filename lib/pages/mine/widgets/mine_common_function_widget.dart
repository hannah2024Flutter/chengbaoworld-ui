import 'package:castleworld/config/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：

class MineCommonFunctionWidget extends StatelessWidget {
  const MineCommonFunctionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Map<String, String> actionMap = {
    //   'ic_mine_address': '收货地址',
    //   'ic_mine_account': '我的资料',
    //   'ic_mine_zfb': '支付宝绑定',
    //   'ic_mine_id': '身份认证',
    //   'ic_mine_play': '试玩订单',
    //   'ic_mine_live': '生活缴费',
    //   'ic_mine_ad': '广告收益',
    //   'ic_mine_reques': '合作申请',
    // };
    // GridView.builder(
    //   itemCount: actionMap.length,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 4,
    //     crossAxisSpacing: 17.h,
    //   ),
    //   itemBuilder: (a, b) {
    //     return _getMineNormalActionsItemWidget(
    //         actionMap.keys.elementAt(b), actionMap.values.elementAt(b));
    //   },
    // ),
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          '常用功能',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff333333),
          ),
        ),
        SizedBox(height: 15.h),
        Flex(
          direction: Axis.horizontal,
          children: [
            _getMineNormalActionsItemWidget('ic_mine_address', '收货地址', () {
              //todo
            }),
            _getMineNormalActionsItemWidget('ic_mine_account', '我的资料', () {
              //todo
            }),
            _getMineNormalActionsItemWidget('ic_mine_zfb', '支付宝绑定', () {
              //todo
            }),
            _getMineNormalActionsItemWidget('ic_mine_id', '身份认证', () {
              //todo
            }),
          ],
        ),
        SizedBox(height: 15.h),
        Flex(
          direction: Axis.horizontal,
          children: [
            _getMineNormalActionsItemWidget('ic_mine_play', '试玩订单', () {
              //todo
            }),
            _getMineNormalActionsItemWidget('ic_mine_live', '生活缴费', () {
              //todo
            }),
            _getMineNormalActionsItemWidget('ic_mine_ad', '广告收益', () {
              //todo
            }),
            _getMineNormalActionsItemWidget('ic_mine_request', '合作申请', () {
              //todo
            }),
          ],
        ),
        SizedBox(height: 36.h),
      ],
    );
  }

  Widget _getMineNormalActionsItemWidget(String img, String text, Function function) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: function.call(),
        child: Column(
          children: [
            Image.asset(
              getImgPath(img),
              fit: BoxFit.fill,
              width: 30.w,
              height: 30.w,
            ),
            SizedBox(height: 10.h),
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
