import 'package:castleworld/common/routers/app_routes.dart';
import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/mine/my_social_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：

class TeamDetailItemWidget extends StatefulWidget {
  const TeamDetailItemWidget({super.key});

  @override
  State<TeamDetailItemWidget> createState() => _TeamDetailItemWidgetState();
}

class _TeamDetailItemWidgetState extends State<TeamDetailItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              _leftImage(),
              SizedBox(width: 10.w),
              _centerInfo(),
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
                    '设置分佣',
                    style: TextStyle(fontSize: 12.sp, color: const Color(0xffffffff)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          _idAndTime(),
          SizedBox(height: 20.h),
          Container(
            decoration: const BoxDecoration(color: Color(0xffe1e1e1)),
            height: 0.5.h,
          )
        ],
      ),
    );
  }

  Widget _leftImage() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(40.r)),
          child: Image.asset(
            getImgPath('bg_mine_title'),
            fit: BoxFit.fill,
            width: 40.w,
            height: 40.w,
          ),
        ),
        Container(
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
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
          child: Text(
            '直邀',
            style: TextStyle(fontSize: 8.sp, color: const Color(0xffffffff)),
          ),
        ),
      ],
    );
  }

  Widget _centerInfo() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Text(
            '测试',
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xff333333),
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff3faff),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 2.h, bottom: 2.h),
                child: Text(
                  '实名认证',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff0E8AFD),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff3faff),
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 2.h, bottom: 2.h),
                child: Text(
                  '已开矿',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff0E8AFD),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _idAndTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ID：3480234｜加入时间 2023-07-05 12:43',
          style: TextStyle(fontSize: 12.sp, color: const Color(0xff8e8e8e)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        InkWell(
          onTap: () {
            //todo
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(color: const Color(0xff979797), width: 0.5),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 7.w, right: 7.w),
            child: Row(
              children: [
                Text(
                  '查看',
                  style: TextStyle(fontSize: 12.sp, color: const Color(0xff979797)),
                ),
                SizedBox(width: 2.w),
                Image.asset(
                  getImgPath('ic_right_arrow'),
                  fit: BoxFit.fill,
                  width: 4.7.r,
                  height: 8.r,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
