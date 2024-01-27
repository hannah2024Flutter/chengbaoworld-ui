import 'package:castleworld/common/services/user_service.dart';
import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/mine/controller/mine_controller.dart';
import 'package:castleworld/pages/mine/widgets/mine_center_widget.dart';
import 'package:castleworld/pages/mine/widgets/mine_common_function_widget.dart';
import 'package:castleworld/pages/mine/widgets/mine_function_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 创建时间：2024/1/26
/// 作者：hannah
/// 描述：我的

class Mine extends StatefulWidget {
  const Mine({super.key});

  @override
  State<Mine> createState() => _MineState();
}

class _MineState extends State<Mine> {
  MineController dataController = Get.put(MineController());

  @override
  initState() {
    super.initState();
    dataController.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ///背景
              Image.asset(
                getImgPath('bg_mine_title'),
                fit: BoxFit.fill,
                width: double.infinity,
                height: 250.h,
              ),

              ///内容
              _getMineContentWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMineContentWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.w,
        right: 14.w,
        bottom: 14.h,
        top: 20.h + MediaQuery.of(context).padding.top,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getMineUserInfoWidget(),
          const MineFunctionWidget(),
          _getMineBooksWidget(),
          const MineCenterWidget(),
          _getMineTeamsWidget(),
          const MineCommonFunctionWidget(),
        ],
      ),
    );
  }

  Widget _getMineUserInfoWidget() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(62.r)),
          child: UserService().userInfo.avatar?.isNotEmpty == true
              ? Image.network(
                  UserService().userInfo.avatar ?? '',
                  fit: BoxFit.fill,
                  width: 62.r,
                  height: 62.r,
                )
              : Image.asset(
                  getImgPath('ic_mine_image_default'),
                  fit: BoxFit.fill,
                  width: 62.r,
                  height: 62.r,
                ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              UserService().userInfo.nickname ?? '暂无数据',
              style: TextStyle(
                // fontFamily: 'yf',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff333333),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Text(
                  'ID:${UserService().userInfo.id ?? '暂无数据'}',
                  style: TextStyle(fontSize: 12.sp, color: const Color(0xff7b7b7b)),
                ),
                SizedBox(width: 4.w),
                GestureDetector(
                  onTap: () {
                    ///TODO,点击copyID
                  },
                  child: Image.asset(
                    getImgPath('ic_mine_id_copy', sux: '.png'),
                    width: 14.w,
                    height: 14.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _getMineBooksWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      padding: EdgeInsets.only(top: 22.h, bottom: 20.h),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          _getMineBookItem('ic_mine_book_un_payed', '待付款', () {
            //todo
          }),
          _getMineBookItem('ic_mine_book_un_shipped', '待发货', num: 10, () {
            //todo
          }),
          _getMineBookItem('ic_mine_book_un_received', '待收货', () {
            //todo
          }),
          _getMineBookItem('ic_mine_book_all', '全部订单', () {
            //todo
          }),
        ],
      ),
    );
  }

  Widget _getMineBookItem(
    String img,
    String text,
    Function function, {
    int? num,
  }) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          function.call();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  getImgPath(img),
                  fit: BoxFit.fill,
                  width: 25.w,
                  height: 25.w,
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
            Visibility(
              visible: (num ?? 0) != 0,
              child: Positioned(
                top: 0,
                right: 25,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  width: 15.r,
                  height: 15.r,
                  alignment: Alignment.center,
                  child: Text(
                    num.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 8.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getMineTeamsWidget() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff6f9ff),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 15.h),
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                getImgPath('ic_mine_teams'),
                fit: BoxFit.fill,
                width: 48.w,
                height: 48.w,
              ),
              SizedBox(width: 10.w),
              Text(
                '我的团队',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff333333),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  //todo
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff027FFD),
                        Color(0xff77EDFF),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(14.r)),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
                  child: Text(
                    '邀请好友',
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xffffffff)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Flex(
            direction: Axis.horizontal,
            children: [
              _getMineTeamsItemWidget('团队好友', '124人'),
              SizedBox(width: 5.w),
              _getMineTeamsItemWidget('今日新增', '34人'),
              SizedBox(width: 5.w),
              _getMineTeamsItemWidget('累计产出宝石', '54653', leftImg: 'ic_mine_equal'),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            '宝石每日收益统计',
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xff444F66),
            ),
          ),
          SizedBox(height: 10.h),
          Flex(
            direction: Axis.horizontal,
            children: [
              _getMineTeamsItemWidget('团队今日产出', '213.15.00'),
              SizedBox(width: 13.w),
              _getMineTeamsItemWidget('我的今日产出', '213.15.00'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getMineTeamsItemWidget(String title, String content, {String? leftImg}) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff8e8e8e),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: leftImg?.isNotEmpty == true,
                  child: Image.asset(
                    getImgPath(leftImg ?? ''),
                    fit: BoxFit.fill,
                    width: 9.w,
                    height: 6.w,
                  ),
                ),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff333333),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
