import 'package:castleworld/config/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：我的仓库

class MyStore extends StatefulWidget {
  const MyStore({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyStoreState();
  }
}

class _MyStoreState extends State<MyStore> {
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
              _getContentView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getContentView() {
    return Padding(
      padding: EdgeInsets.all(14.w),
      child: Column(
        children: [
          _toolBarWidget(),
          _myJewelWidget(),
          _moreServiceWidget(),
          _moreServiceEntryWidget(),
        ],
      ),
    );
  }

  Widget _toolBarWidget() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back_ios_new_sharp),
              ),
              Container(
                margin: EdgeInsets.only(left: 62.w),
                child: Text(
                  "我的仓库",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  //todo
                },
                child: Row(
                  children: [
                    Image.asset(
                      getImgPath('ic_mine_store_detail'),
                      fit: BoxFit.fill,
                      width: 22.w,
                      height: 24.w,
                    ),
                    SizedBox(width: 7.w),
                    Text(
                      "账户明细",
                      style: TextStyle(
                        color: const Color(0xff333333),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _myJewelWidget() {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color(0xff027FFD),
            Color(0xff779DFF),
          ]),
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 15.h, bottom: 15.h),
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "我的宝石/个",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            "349723498.00",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "我的闪卡/张",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      "253",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      //todo
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff78A0FF),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h, bottom: 5.h),
                      child: Text(
                        "宝石赠送",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InkWell(
                    onTap: () {
                      //todo
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff78A0FF),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h, bottom: 5.h),
                      child: Text(
                        "闪卡合成",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _moreServiceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          '更多服务',
          style: TextStyle(
            color: const Color(0xff333333),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        _moreServiceItemWidget('¥188.00', '任务收入'),
        _moreServiceItemWidget('¥188.00', '游戏收入'),
      ],
    );
  }

  Widget _moreServiceItemWidget(String money, String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF7FBFF),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      padding: EdgeInsets.only(left: 11.w, right: 11.w, top: 17.h, bottom: 17.h),
      margin: EdgeInsets.only(top: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  getImgPath('ic_mine_store_in'),
                  fit: BoxFit.fill,
                  width: 38.w,
                  height: 38.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Text(
                      money,
                      style: TextStyle(
                        color: const Color(0xff333333),
                        fontSize: 14.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: const Color(0xff868686),
                        fontSize: 12.sp,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              //todo
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xff027FFD),
                  Color(0xff779DFF),
                ]),
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
              ),
              padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 5.h, bottom: 5.h),
              child: Text(
                "兑换",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moreServiceEntryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          '更多服务',
          style: TextStyle(
            color: const Color(0xff333333),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Flex(
          direction: Axis.horizontal,
          children: [
            _moreServiceEntryItemWidget('ic_mine_store_service', '宝石转赠', () {}),
            _moreServiceEntryItemWidget('ic_mine_store_dy', '宝石质押', () {}),
            const Expanded(flex: 1, child: SizedBox()),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        )
      ],
    );
  }

  Widget _moreServiceEntryItemWidget(String img, String text, Function function) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          function.call();
        },
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
