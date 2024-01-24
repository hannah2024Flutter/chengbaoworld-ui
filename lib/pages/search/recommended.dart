import 'package:flutter/material.dart';

class RecommendedSearchWidget extends StatefulWidget {
  @override
  _RecommendedSearchWidgetState createState() =>
      _RecommendedSearchWidgetState();
}

class _RecommendedSearchWidgetState extends State<RecommendedSearchWidget> {
  late List<Widget> recommendedSearchItems;

  @override
  void initState() {
    super.initState();
    recommendedSearchItems = List.generate(
      4,
      (index) => _buildSearchItem('城堡世界如何开卡'),
    );
  }

  void refreshUi() {
    setState(() {
      // 这里可以修改recommendedSearchItems数据，例如：
      recommendedSearchItems = List.generate(
        4,
        (index) => _buildSearchItem('新的搜索项 $index'),
      );
    });
  }

  Widget _buildSearchItem(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 66, 0),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                print('$title was tapped!');
              },
              child: Text(
                title,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print('$title was tapped!');
            },
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

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
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  refreshUi(); // 当点击“换一换”时，调用refreshUi方法刷新UI
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(233, 246, 255, 1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
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
                      const SizedBox(width: 2),
                      const Text(
                        '换一换',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(14, 138, 253, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: recommendedSearchItems,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRecommendedSearch();
  }
}
