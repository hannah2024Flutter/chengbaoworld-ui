import 'package:castleworld/pages/product_detail/widget/item_cell.dart';
import 'package:flutter/material.dart';

class AllContactStoreManager extends StatefulWidget {
  const AllContactStoreManager({super.key});

  @override
  State<AllContactStoreManager> createState() => _AllContactStoreManagerState();
}

class _AllContactStoreManagerState extends State<AllContactStoreManager> {
  Widget searchView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width - 28,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF444F66),
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/ic_search.png",
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "请输入搜索内容"),
              style: TextStyle(color: Color(0xFF444F66), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/bg_all_store_manager.png",
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                      const Text(
                        "全部店长",
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      const Opacity(
                        opacity: 0,
                        child: Icon(Icons.arrow_back_ios_new_sharp),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                searchView(),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        15,
                        (index) => const ItemCell(showBgColor: false),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
