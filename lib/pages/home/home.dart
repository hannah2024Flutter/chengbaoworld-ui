import 'dart:ui';

import 'package:castleworld/config/Utils.dart';
import 'package:flutter/material.dart';

import '../widgits/marque_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<DycModel> dms = [];

  @override
  void initState() {
    dms = List.generate(120, (index) {
      return DycModel(
          img: 'https://pic3.zhimg.com/v2-5939b4c866d69a95556dbf031252935b_r.jpg?source=1940ef5c',
          title: '张*龙$index新注册平台');
    }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          buildTap1(size),
          buildTap2(),
          buildDyc(),
          buildHot(),
          SliverPadding(
            sliver: SliverGrid(delegate:SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network('https://img2.baidu.com/it/u=1711066208,576917554&fm=253&fmt=auto&app=138&f=JPEG?w=667&h=500',
                      width: double.infinity,
                        height: 168,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 6),
                      child: Text('城堡世界卡城堡世界卡城 堡世界卡城堡世界',maxLines: 2,
                        overflow: TextOverflow.ellipsis,style: TextStyle(color: Color(0xff333333),height: 1.4,fontSize: 14,),),
                    ),
                    Row(
                      children: [
                        RichText(text: TextSpan(
                          text: '¥',
                          style: TextStyle(color: Color(0xffFF3B3B),fontSize: 12),
                          children: [
                            TextSpan(
                              text: '170.00',
                              style: TextStyle(color: Color(0xffFF3B3B),fontSize: 24,height: .9),
                            )
                          ]
                        )),
                        SizedBox(width: 4,),
                        Image.asset(getImgPath('ic_home_sk'),height: 14,fit: BoxFit.fitHeight,)
                      ],
                    )
            
                  ],
                );
              },
              childCount: 10,
            ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 245,
              mainAxisSpacing: 12,
              crossAxisSpacing: 11, crossAxisCount: 2,
            
            )), padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 30),
          )
          
        ],
      ),
    );
  }

  SliverToBoxAdapter buildHot() {
    return SliverToBoxAdapter(
          child: Container(
              margin: EdgeInsets.only(top: 18,left: 14),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Text('热门专区',style: TextStyle(color: Color(0xff333333),fontSize: 14,fontWeight: FontWeight.w600),),
                  Positioned(
                      bottom: -2,
                      left: -2,
                      child: Image.asset(getImgPath('ic_home_bg',),width: 32,height: 8,fit: BoxFit.fill,))
                ],
              )),
        );
  }

  SliverToBoxAdapter buildDyc() {
    return SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 120,
            padding: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff9FFFFC),
                Color(0xff9FFFFC),
                Color(0xffD59FFF),
                Color(0xff9FFFFC),
              ]),
            ),
            child: Stack(
              children: [

                Container(
                  width: double.infinity,
                  height: 120,
                  child: Builder(
                      builder: (context) {
                        return MarqueeWidget(
                          movingWidget: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                  children: List.generate(
                                      3, (index) {
                                    final d1 = dms.skip(
                                        (dms.length / 3 * index).ceil()).take(
                                        (dms.length / 3).floor());
                                    print("ssss:${d1.length}");
                                    return Row(
                                        children: d1.map((e) =>
                                            Container(
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.only(right: 10,top: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(13),

                                              ),
                                              child: Row(
                                                children: [
                                                  ClipOval(
                                                      child: Image.network(
                                                        '${e.img}', width: 22,
                                                        height: 22,)),
                                                  SizedBox(width: 3,),
                                                  Text('${e.title}',
                                                    style: TextStyle(
                                                        color: Color(
                                                            0xff5984B1),
                                                        fontSize: 12),)
                                                ],
                                              ),
                                            )).toList()
                                    );
                                  })
                              )
                          ),

                        );
                      }
                  ),
                ),
                Positioned(
                    left: 0,
                    top: 15,
                    child: Image.asset(getImgPath('bg_home_dyc'), width: 45,
                      fit: BoxFit.fitWidth,)),
              ],
            ),
          ),
        );
  }

  SliverToBoxAdapter buildTap2() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 14, right: 14, bottom: 16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(getImgPath('ic_home_rank'),),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),
            SizedBox(width: 13,),
            Expanded(
              child: Container(
                height: 85,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(getImgPath('ic_home_ivn')),
                        fit: BoxFit.fill
                    )
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter buildTap1(Size size) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 165,
        margin: const EdgeInsets.only(
            left: 14, right: 14, top: 16, bottom: 10),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(left: 14, top: 16),
                width: (size.width / 2) - 14,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(getImgPath('ic_home_tap_1')),
                        fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '购买闪卡',
                      style: TextStyle(
                          fontFamily: 'yf',
                          fontSize: 30,
                          height: 1.2,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      '开启城堡',
                      style: TextStyle(

                          fontSize: 12,
                          height: 1.3,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              // child: Image.asset(getImgPath('ic_home_tap_1'),
              //   width: (size.width/2)-14-1.5,
              //   fit: BoxFit.fill,
              // ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: (size.width / 2) - 14 - 1.5,
                height: 165 / 2 - 5,
                padding: EdgeInsets.only(left: 17, top: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(
                      getImgPath('ic_home_tap_2'),
                    ), fit: BoxFit.fill
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('应用大厅', style: TextStyle(fontSize: 24,
                        fontFamily: 'yf',
                        color: Colors.white,
                        height: 1.1),),
                    SizedBox(height: 4,),
                    Text('这是一段副文案', style: TextStyle(
                        fontSize: 12, color: Colors.white, height: 1.2),),

                  ],
                ),
              ),

            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: ((size.width / 2)) / 2,
                    height: 165 / 2 - 5,
                    padding: EdgeInsets.only(left: 16, top: 7),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              getImgPath('ic_home_tap_3'),
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Text('规则', style: TextStyle(
                        fontFamily: 'yf', fontSize: 24, color: Colors.white),),
                  ),
                  Container(
                    width: ((size.width / 2)) / 2,
                    height: 165 / 2 - 5,
                    padding: EdgeInsets.only(left: 16, top: 7),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              getImgPath('ic_home_tap_4'),
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Text('说明', style: TextStyle(
                        fontFamily: 'yf', fontSize: 24, color: Colors.white),),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverToBoxAdapter(
      child:  SizedBox(
        height: 300+MediaQuery.of(context).padding.top,
        child: Stack(
          children: [
            Image.asset(
              getImgPath('bg_home_homebg'),
              width: double.infinity,
              height: 211,
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    children: [
                      Image.asset(
                        getImgPath('ic_home_loc'),
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '北京',
                        style:
                        TextStyle(color: Color(0xff333333), fontSize: 16),
                      ),
                      Spacer(),
                      Image.asset(
                        getImgPath('ic_home_kf'),
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(
                        width: 29,
                      ),
                      Image.asset(
                        getImgPath('ic_home_msg'),
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFF444F66), width: 1)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        getImgPath('ic_home_srh'),
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        '请输入搜索内容',
                        style:
                        TextStyle(color: Color(0xFF444F66), fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Image.asset(
                    getImgPath('bg_home_banner'),
                    width: double.infinity,
                    height: 162,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return SliverAppBar(
    //     expandedHeight: 300,
    //     floating: false,
    //     snap: false,
    //     pinned: false,
    //     flexibleSpace: Stack(
    //       children: [
    //         Image.asset(
    //           getImgPath('bg_home_homebg'),
    //           width: double.infinity,
    //           height: 211,
    //           fit: BoxFit.fill,
    //         ),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 14),
    //               child: Row(
    //                 children: [
    //                   Image.asset(
    //                     getImgPath('ic_home_loc'),
    //                     width: 18,
    //                     height: 18,
    //                   ),
    //                   SizedBox(
    //                     width: 4,
    //                   ),
    //                   Text(
    //                     '北京',
    //                     style:
    //                     TextStyle(color: Color(0xff333333), fontSize: 16),
    //                   ),
    //                   Spacer(),
    //                   Image.asset(
    //                     getImgPath('ic_home_kf'),
    //                     width: 24,
    //                     height: 24,
    //                   ),
    //                   SizedBox(
    //                     width: 29,
    //                   ),
    //                   Image.asset(
    //                     getImgPath('ic_home_msg'),
    //                     width: 24,
    //                     height: 24,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             Container(
    //               height: 40,
    //               margin: EdgeInsets.symmetric(horizontal: 14),
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(20),
    //                   border: Border.all(color: Color(0xFF444F66), width: 1)),
    //               child: Row(
    //                 children: [
    //                   SizedBox(
    //                     width: 10,
    //                   ),
    //                   Image.asset(
    //                     getImgPath('ic_home_srh'),
    //                     width: 18,
    //                     height: 18,
    //                   ),
    //                   SizedBox(
    //                     width: 14,
    //                   ),
    //                   Text(
    //                     '请输入搜索内容',
    //                     style:
    //                     TextStyle(color: Color(0xFF444F66), fontSize: 12),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               height: 16,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 14),
    //               child: Image.asset(
    //                 getImgPath('bg_home_banner'),
    //                 width: double.infinity,
    //                 height: 162,
    //                 fit: BoxFit.fill,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ));
  }
}

class DycModel {
  final String img;
  final String title;

  DycModel({required this.img, required this.title});
}