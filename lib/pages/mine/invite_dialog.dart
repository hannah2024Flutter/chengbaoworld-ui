import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/mine/controller/invite_dialog_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：邀请好友 底部弹窗

class InviteDialog extends StatefulWidget {
  const InviteDialog({super.key});

  @override
  State<InviteDialog> createState() => _InviteDialogState();
}

class _InviteDialogState extends State<InviteDialog> {
  InviteDialogController dataController = Get.put(InviteDialogController());

  @override
  initState() {
    super.initState();
    dataController.onInit();
  }

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
      height: 400.h,
      padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 16.h, bottom: 16.h),
      child: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              _titleView(),
              _userImgView(),
              _superIdView(),
              _saveBtn(),
              _readAgreement(),
            ],
          ),
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
            "绑定邀请人 加入团队",
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

  Widget _userImgView() {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(80.r)),
        child: Image.asset(
          getImgPath('ic_mine_image_default'),
          fit: BoxFit.fill,
          width: 80.r,
          height: 80.r,
        ),
      ),
    );
  }

  Widget _superIdView() {
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
            "上级ID",
            style: TextStyle(
              color: const Color(0xFF444444),
              fontSize: 14.sp,
            ),
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: const Color(0xFF0E8AFD),
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
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
                FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
                LengthLimitingTextInputFormatter(20),
              ],
              onChanged: (text) {
                dataController.superId.value = text;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _saveBtn() {
    return InkWell(
      onTap: () {
        dataController.saveData();
      },
      child: Container(
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
          "确认绑定",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _readAgreement() {
    return InkWell(
      onTap: () {
        dataController.isRead.value = !dataController.isRead.value;
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 12.h, top: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.w,
              width: 12.w,
              child: Checkbox(
                value: dataController.isRead.value,
                onChanged: (isChecked) {
                  dataController.isRead.value = isChecked!;
                },
                activeColor: const Color(0xFF0974FF),
                checkColor: const Color(0xFFB3B3B3),
                side: const BorderSide(color: Color(0xFFB3B3B3), width: .5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xFFB3B3B3), width: .5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(width: 4.w),
            RichText(
              text: TextSpan(
                text: '已阅读',
                style: TextStyle(color: const Color(0xFFADADAD), fontSize: 12.sp),
                children: [
                  TextSpan(
                    text: '《好友关系协议》',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(AppRoutes.prvAgreemeet);
                      },
                    style: TextStyle(color: const Color(0xFF0974FF), fontSize: 12.sp),
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
