import 'package:castleworld/config/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：我的社交详情 底部弹窗

class MySocialInfoDialog extends StatefulWidget {
  const MySocialInfoDialog({super.key});

  @override
  State<MySocialInfoDialog> createState() => _MySocialInfoDialogState();
}

class _MySocialInfoDialogState extends State<MySocialInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4f5f5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(29.r),
          topRight: Radius.circular(29.r),
        ),
      ),
      height: 455.h,
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 16.h, bottom: 16.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _titleView(),

            ///微信号
            _wxView(),

            ///QQ号
            _qqView(),

            ///邀请
            _inviteView(),

            ///保存
            _saveBtn(),
          ],
        ),
      ),
    );
  }

  Widget _titleView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            "我的社交信息",
            style: TextStyle(
              color: const Color(0xFF333333),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            getImgPath('ic_mine_close'),
            fit: BoxFit.fill,
            width: 13.w,
            height: 13.w,
          ),
        ),
      ],
    );
  }

  Widget _wxView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 2.h, bottom: 2.h),
      margin: EdgeInsets.only(bottom: 12.h, top: 12.h),
      child: Row(
        children: [
          Text(
            "微信号",
            style: TextStyle(
              color: const Color(0xFF444444),
              fontSize: 14.sp,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                hintText: '请输入',
                hintStyle: TextStyle(
                  color: const Color(0xFF8e8e8e),
                  fontSize: 14.sp,
                ),
                border: InputBorder.none, //hide undLine
                counterText: '',
              ),
              inputFormatters: [
                FilteringTextInputFormatter('0-9a-zA-Z_', allow: true),
                LengthLimitingTextInputFormatter(20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qqView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 2.h, bottom: 2.h),
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "QQ号",
            style: TextStyle(
              color: const Color(0xFF444444),
              fontSize: 14.sp,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                hintText: '请输入',
                hintStyle: TextStyle(
                  color: const Color(0xFF8e8e8e),
                  fontSize: 14.sp,
                ),
                border: InputBorder.none, //hide undLine
                counterText: '',
              ),
              inputFormatters: [
                FilteringTextInputFormatter('0-9', allow: true),
                LengthLimitingTextInputFormatter(20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _inviteView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "我的邀请人可见",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 14.sp,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  getImgPath('btn_switch_open'),
                  fit: BoxFit.fill,
                  width: 52.w,
                  height: 26.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 28.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "我邀请的好友可见",
                style: TextStyle(
                  color: const Color(0xFF333333),
                  fontSize: 14.sp,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  getImgPath('btn_switch_close'),
                  fit: BoxFit.fill,
                  width: 52.w,
                  height: 26.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _saveBtn() {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff027FFD),
            Color(0xff779DFF),
          ]),
          borderRadius: BorderRadius.all(Radius.circular(29.r))),
      padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
      margin: EdgeInsets.only(top: 27.h, bottom: 10.h, left: 40.w, right: 40.w),
      width: double.infinity,
      child: Text(
        "保存",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
