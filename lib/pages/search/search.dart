import 'package:castleworld/pages/search/recommended.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

var searchHistoryListData = [
  '新天鹅堡',
  '布兰城堡',
  '燕窝',
  '布兰城堡',
  '多南',
  '新天鹅堡',
  '布兰城堡',
  '燕窝',
  '多南'
];
var hotSearchItem = ['热搜卡片', '热搜游戏'];

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height - 200,
            child: _bgpic(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  14, MediaQuery.of(context).padding.top + 14, 14, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: _buildSearchHistory(),
                  ),
                  RecommendedSearchWidget(),
                  HotSearchSwitchWidget(),
                  _buildHotSearchCards()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bgpic() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 151,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover, // 图片自适应填满容器且保持宽高比不变
          image:
              AssetImage('assets/images/bg_home_homebg.webp'), // 替换为您的背景图片资源路径
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: ImageIcon(AssetImage('assets/search/search.png')),
                hintText: '请输入搜索内容',
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(19)),
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
            ),
          ),
          //const SizedBox(width: 8),
          TextButton(
              onPressed: () {},
              child: const Text(
                '取消',
                style: TextStyle(fontSize: 14, color: Colors.black),
              )),
        ],
      ),
    );
  }

  List<Widget> historySearchitems = List.generate(
    searchHistoryListData.length,
    (index) {
      if (index == searchHistoryListData.length - 1) {
        // 检查是否是最后一个元素
        return Flexible(
          child: InkWell(
            onTap: () {
              print('Button was tapped!');
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(11, 9, 11, 9),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 247, 243, 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Flexible(
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/search/more@2x.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ); // 返回自定义的最后一个组件
      } else {
        return Flexible(
          child: InkWell(
            onTap: () {
              print('Button was tapped!');
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 247, 243, 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                searchHistoryListData[index],
                style: const TextStyle(
                    color: Color.fromRGBO(255, 126, 69, 1), fontSize: 12),
              ),
            ),
          ),
        ); // 其他元素则使用默认样式
      }
    },
  );

  Widget _buildSearchHistory() {
    return Container(
      height: 124,
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                  child: Text(
                '历史搜索',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )),
              Container(
                height: 16,
                width: 16,
                padding: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover, // 图片自适应填满容器且保持宽高比不变
                    image: AssetImage('assets/search/delete@2x.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            width: MediaQuery.of(context).size.width,
            child: Wrap(
              spacing: 10.0, // 子元素之间的间距
              runSpacing: 9.0, // 换行之间的间距
              children: historySearchitems,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> recommendedSearchitems = List.generate(4, (index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 66, 0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
                onTap: () {
                  print('城堡世界如何开卡 was tapped!');
                },
                child: Text(
                  '城堡世界如何开卡',
                  style: TextStyle(color: Colors.grey[600]),
                )),
          ),
          InkWell(
              onTap: () {
                print('城堡世界如何开卡 was tapped!');
              },
              child: Text(
                '城堡世界如何开卡',
                style: TextStyle(color: Colors.grey[600]),
              )),
        ],
      ),
    );
  });

  Widget _buildRecommendedSearch() {
    return Container(
      //height: 180,
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Text(
                  '文章搜索',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              )),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  print('换一换 was tapped!');
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(233, 246, 255, 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Flexible(
                    child: Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/search/change@2x.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text(
                          '换一换',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(14, 138, 253, 1)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: recommendedSearchitems,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHotSearchCards() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          _buildHotSearchCard(1, '密林古堡', 8.2, '', true),
          _buildHotSearchCard(2, '科文古堡', 8.2, '', false),
          _buildHotSearchCard(3, '得哈尔堡', 8.2, '', false),
          _buildHotSearchCard(4, '温莎古堡', 8.2, '', true),
          _buildHotSearchCard(5, '塞哥维亚古堡', 8.2, '', false),
        ],
      ),
    );
  }

  Widget HotIndex(int index) {
    var indexIconPath = '';
    switch (index) {
      case 1:
        indexIconPath = 'assets/search/no1@2x.png';
        break;
      case 2:
        indexIconPath = 'assets/search/no2@2x.png';
        break;
      case 3:
        indexIconPath = 'assets/search/no3@2x.png';
        break;
      default:
    }
    if (index >= 4) {
      return Container(
        width: 32,
        height: 32,
        child: Center(
          child: Text(
            '$index',
            style: const TextStyle(
                color: Color.fromRGBO(255, 77, 77, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      );
    } else {
      return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(indexIconPath),
          ),
        ),
      );
    }
  }

  Widget _buildHotSearchCard(
      int index, String title, double rating, String assetPath, bool updown) {
    var upDownIconPath = '';

    if (updown == true) {
      upDownIconPath = 'assets/search/up@2x.png';
    } else {
      upDownIconPath = 'assets/search/down@2x.png';
    }
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          HotIndex(index),
          const SizedBox(width: 10),
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/search/demo.png'),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16)),
                Text(
                  '$rating | 用户评分',
                  style: const TextStyle(
                      color: Color.fromRGBO(14, 138, 253, 1), fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            width: 14,
            height: 28,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(upDownIconPath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HotSearchSwitchWidget extends StatefulWidget {
  @override
  _HotSearchSwitchWidgetState createState() => _HotSearchSwitchWidgetState();
}

class _HotSearchSwitchWidgetState extends State<HotSearchSwitchWidget> {
  bool _isFirstClicked = true;
  bool _isSecondClicked = false;

  void _handleClick(int clickedIndex) {
    setState(() {
      if (clickedIndex == 1) {
        _isFirstClicked = true;
        _isSecondClicked = false;
      } else {
        _isFirstClicked = false;
        _isSecondClicked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildHotSearchSwich();
  }

  Widget _buildHotSearchSwich() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _handleClick(1),
                  child: Column(
                    children: [
                      Text('热搜卡片',
                          style: _isFirstClicked
                              ? const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(14, 138, 253, 1))
                              : const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                      _isFirstClicked
                          ? Container(
                              height: 4,
                              width: 22,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/search/butline@2x.png'),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                )),
            const SizedBox(
              width: 36,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => _handleClick(2),
                  child: Column(
                    children: [
                      Text('热搜游戏',
                          style: _isSecondClicked
                              ? const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(14, 138, 253, 1))
                              : const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                      _isSecondClicked
                          ? Container(
                              height: 4,
                              width: 22,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/search/butline@2x.png'),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                )),
          ],
        ));
  }
}
