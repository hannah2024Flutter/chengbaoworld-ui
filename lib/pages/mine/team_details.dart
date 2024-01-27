import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/mine/widgets/switch_type_widget.dart';
import 'package:castleworld/pages/mine/widgets/team_detail_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 创建时间：2024/1/27
/// 作者：hannah
/// 描述：团队详情

class TeamDetails extends StatefulWidget {
  const TeamDetails({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TeamDetailsState();
  }
}

class _TeamDetailsState extends State<TeamDetails> {
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
          SizedBox(height: 20.h),
          SwitchTypeWidget(
            leftTitle: '直邀好友',
            rightTitle: '间邀好友',
            typeSelectChange: (index) {},
          ),
          SizedBox(height: 14.h),
          _searchWidget(),


          SizedBox(height: 14.h),
          const TeamDetailItemWidget(),
          // TabBar(
          //   controller: tabController,
          //   tabs: [
          //     Tab(
          //       child: Text(
          //         "直邀好友",
          //         style: TextStyle(
          //           color: const Color(0xFFFFFFFF),
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ),
          //     Tab(
          //       child: Text(
          //         "间邀好友",
          //         style: TextStyle(
          //           color: const Color(0xFFFFFFFF),
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const Expanded(
          //   child: TabBarView(
          //     children: [
          //       Column(
          //         children: [
          //           TeamDetailItemWidget(),
          //           TeamDetailItemWidget(),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           TeamDetailItemWidget(),
          //           TeamDetailItemWidget(),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
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
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(),
                  alignment: Alignment.center,
                  child: Text(
                    "团队详情",
                    style: TextStyle(
                      color: const Color(0xFF333333),
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchWidget() {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xFF444F66), width: 1)),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Image.asset(
            getImgPath('ic_home_srh'),
            width: 18.w,
            height: 18.w,
          ),
          SizedBox(
            width: 14.w,
          ),
          Text(
            '请输入搜索内容',
            style: TextStyle(color: const Color(0xFF444F66), fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
