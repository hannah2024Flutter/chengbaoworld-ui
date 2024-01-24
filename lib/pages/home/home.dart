import 'package:castleworld/config/Utils.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          buildTap1(size),
          SliverToBoxAdapter(
            child:Container(
              margin: EdgeInsets.only(left: 14,right: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(getImgPath('ic_home_rank'))
                        )
                      ),
                    ),
                  ), Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(getImgPath('ic_home_ivn'))
                        )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
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
                    padding: EdgeInsets.only(left: 14,top: 16),
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
                    padding: EdgeInsets.only(left: 17,top: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(
                        getImgPath('ic_home_tap_2'),
                      ),fit: BoxFit.fill
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('应用大厅',style: TextStyle(fontSize: 24,fontFamily: 'yf',color: Colors.white,height: 1.1),),
                        SizedBox(height: 4,),
                        Text('这是一段副文案',style: TextStyle(fontSize: 12,color: Colors.white,height: 1.2),),

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
                        padding: EdgeInsets.only(left: 16,top: 7),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              getImgPath('ic_home_tap_3'),
                            ),
                            fit: BoxFit.fill
                          )
                        ),
                        child: Text('规则',style: TextStyle(fontFamily: 'yf',fontSize: 24,color: Colors.white),),
                      ),
                      Container(
                        width: ((size.width / 2)) / 2,
                        height: 165 / 2 - 5,
                        padding: EdgeInsets.only(left: 16,top: 7),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  getImgPath('ic_home_tap_4'),
                                ),
                                fit: BoxFit.fill
                            )
                        ),
                        child: Text('说明',style: TextStyle(fontFamily: 'yf',fontSize: 24,color: Colors.white),),
                      ),


                    ],
                  ),
                ),

              ],
            ),
          ),
        );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
        expandedHeight: 300,
        flexibleSpace: Stack(
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
        ));
  }
}
