import 'package:castleworld/config/Utils.dart';
import 'package:castleworld/pages/mine/mine.dart';
import 'package:castleworld/pages/product_detail/product_detail.dart';
import 'package:castleworld/pages/search/search.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> with SingleTickerProviderStateMixin {
  late TabController _controller;
  final ValueNotifier<int> selectIndex = ValueNotifier(0);
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    selectIndex.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Home(),
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.blue,
          ),
          const Mine(),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selectIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return BottomNavigationBar(
            currentIndex: value,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            type: BottomNavigationBarType.fixed,
            onTap: (i) {
              selectIndex.value = i;
              _controller.animateTo(i);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  getImgPath('ic_home_home_1'),
                  width: 30,
                  height: 30,
                ),
                label: '首页',
                activeIcon: Image.asset(
                  getImgPath('ic_home_home'),
                  width: 30,
                  height: 30,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  getImgPath('ic_home_castle_1'),
                  width: 30,
                  height: 30,
                ),
                label: '城堡世界',
                activeIcon: Image.asset(
                  getImgPath('ic_home_castle'),
                  width: 30,
                  height: 30,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  getImgPath('ic_home_data_1'),
                  width: 30,
                  height: 30,
                ),
                label: '数据中心',
                activeIcon: Image.asset(
                  getImgPath('ic_home_data'),
                  width: 30,
                  height: 30,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  getImgPath('ic_home_me_1'),
                  width: 30,
                  height: 30,
                ),
                label: '个人中心',
                activeIcon: Image.asset(
                  getImgPath('ic_home_me'),
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
