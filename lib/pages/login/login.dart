import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/app_home/app_home.dart';
import 'package:castleworld/pages/login/prv_agreement.dart';
import 'package:castleworld/pages/login/user_agreement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final ValueNotifier<int> selectLoginType = ValueNotifier(0);
  final ValueNotifier<bool> isRead = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                getImgPath('bg_login_appbar'),
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: EdgeInsets.only(left: 19.w, right: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top + 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF).withOpacity(.2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: ValueListenableBuilder(
                        valueListenable: selectLoginType,
                        builder:
                            (BuildContext context, int value, Widget? child) {
                          final show = value == 0;
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  selectLoginType.value = 0;
                                },
                                child: Container(
                                    margin: EdgeInsets.all(2.w),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 6.w),
                                    decoration: show
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(18.r))
                                        : null,
                                    child: Text(
                                      '账号登录',
                                      style: TextStyle(
                                          color: show
                                              ? Color(0xFF0E8AFD)
                                              : Color(0xff333333),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                              GestureDetector(
                                onTap: () {
                                  selectLoginType.value = 1;
                                },
                                child: Container(
                                    margin: EdgeInsets.all(2.w),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.h, horizontal: 6.w),
                                    decoration: !show
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(18.r))
                                        : null,
                                    child: Text(
                                      '手机登录',
                                      style: TextStyle(
                                          color: !show
                                              ? Color(0xFF0E8AFD)
                                              : Color(0xff333333),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              getImgPath('bg_login_text'),
                              height: 42.h,
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '城堡世界',
                              style: TextStyle(
                                  color: Color(0xffADADAD), fontSize: 12.sp),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          getImgPath('bg_login'),
                          height: 83.h,
                          width: 83.h,
                          fit: BoxFit.fill,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, bottom: 20.h),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 18.w, right: 23.w),
                          child: Text(
                            '手机号',
                            style: TextStyle(
                                color: Color(0xff333333), fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: '请输入手机号',
                    hintStyle:
                        TextStyle(color: Color(0xFFB5B5B5), fontSize: 14.sp),
                    fillColor: Color(0xFFF4F8FF))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, bottom: 70.h),
            child: ValueListenableBuilder(
              valueListenable: selectLoginType,
              builder: (BuildContext context, int value, Widget? child) {
                final show = value == 0;
                return TextField(
                    decoration: InputDecoration(
                        prefixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 18.w, right: 23.w),
                              child: Text(
                                show ? '验证码' : '密   码',
                                style: TextStyle(
                                    color: Color(0xff333333), fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                        filled: true,
                        suffixIcon:show? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              margin: EdgeInsets.only(right: 10.w),
                              padding: EdgeInsets.only(top: 6.h, bottom: 6.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.r),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF027FFD),
                                    Color(0xFF77EDFF),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '获取验证码',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.sp),
                              ),
                            ),
                          ],
                        ):null,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: show ? '请输入验证码' : '请输入密码',
                        hintStyle: TextStyle(
                            color: Color(0xFFB5B5B5), fontSize: 14.sp),
                        fillColor: Color(0xFFF4F8FF)));
              },
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AppHome(),
                ),
              );
            },
            child: Container(
              height: 58.h,
              width: 269.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF027FFD),
                      Color(0xFF77EDFF),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
              alignment: Alignment.center,
              child: Text(
                '登录',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50.w,
                height: 1.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0x59FFFFFF),
                  Color(0xFF999999),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 9.w),
                child: Text(
                  '更多登录方式',
                  style: TextStyle(color: Color(0xff999999), fontSize: 12.sp),
                ),
              ),
              Container(
                width: 50.w,
                height: 1.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFF999999),
                  Color(0x59FFFFFF),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              ),
            ],
          ),
          SizedBox(
            height: 23.h,
          ),
          Image.asset(
            getImgPath('ic_wx'),
            width: 50.w,
            height: 50.w,
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: isRead,
                builder: (BuildContext context, bool value, Widget? child) {
                  return SizedBox(
                    height: 12,
                    width: 12,
                    child: Checkbox(
                      value: value,
                      onChanged: (v) {
                        isRead.value = v!;
                      },
                      activeColor: Color(0xFF0974FF),
                      checkColor: Color(0xFFB3B3B3),
                      side: BorderSide(color: Color(0xFFB3B3B3),width: .5),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFFB3B3B3), width: .5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
              ),
              RichText(
                  text: TextSpan(
                      text: '  同意城堡世界',
                      style:
                          TextStyle(color: Color(0xFFADADAD), fontSize: 12.sp),
                      children: [
                    TextSpan(
                      text: '《用户协议》',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                                 MaterialPageRoute<void>(
                                   builder: (BuildContext context) => const UserAgreement(),
                                ),
                          );
                        },
                      style:
                          TextStyle(color: Color(0xFF0974FF), fontSize: 12.sp),
                    ),
                    TextSpan(
                      text: '和',
                      style:
                          TextStyle(color: Color(0xFFADADAD), fontSize: 12.sp),
                    ),
                    TextSpan(
                      text: '《隐私政策》',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => const PrvAgreement(),
                            ),
                          );
                        },
                      style:
                          TextStyle(color: Color(0xFF0974FF), fontSize: 12.sp),
                    ),
                  ]))
            ],
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }
}
