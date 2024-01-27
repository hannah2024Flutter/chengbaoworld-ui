import 'package:castleworld/pages/product_detail/widget/item_cell.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreManager extends StatefulWidget {
  const StoreManager({super.key});

  @override
  State<StoreManager> createState() => _AllContactStoreManagerState();
}

class _AllContactStoreManagerState extends State<StoreManager> {
  var cateArr = ["全部", "城堡闪卡"];
  var cateIndex = 0;
  int count = 0;

  Widget headerView() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return contactTa();
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/bg_detail_bottom_banner.png",
                    width: 62,
                    height: 62,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 11),
              SizedBox(
                height: 62,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Run Tu",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 66.w,
                      height: 18.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                          color: const Color(0xFFFF7316)),
                      child: Text(
                        "一级店长",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.w,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return storeManagerInfo();
                },
              );
            },
            child: Column(
              children: [
                Image.asset(
                  "assets/images/ic_store.png",
                  width: 20,
                  height: 22,
                ),
                const SizedBox(height: 5),
                Text(
                  "我的店长\n   信息",
                  style:
                      TextStyle(color: const Color(0xFF333333), fontSize: 12.w),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget contactCateView(
      String preImage, Color textColor, Color bg, String sufImage) {
    return Container(
      width: (MediaQuery.of(context).size.width - 42) / 2,
      height: 44,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/$preImage",
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            "X574512157",
            style: TextStyle(
                color: textColor, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          Image.asset(
            "assets/images/$sufImage",
            width: 14,
            height: 14,
          ),
        ],
      ),
    );
  }

  Widget contactTa() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.43,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(29)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                ),
                const Text(
                  "联系Ta",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/ic_avator.png",
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "刘西瓜",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ID：237457983",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7B7B7B),
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  "assets/images/ic_idcopy.png",
                  width: 14,
                  height: 14,
                )
              ],
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  contactCateView(
                      "ic_wechat_large.png",
                      const Color(0xFF28C445),
                      const Color(0xFFECFCF0),
                      "ic_wechat_copy.png"),
                  contactCateView("ic_qq.png", const Color(0xFF4F92FF),
                      const Color(0xFFECF7FC), "ic_qq_copy.png"),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width - 106,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(colors: [
                  Color(0xFF027FFD),
                  Color(0xFF77EDFF),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              alignment: Alignment.center,
              child: const Text(
                "设置我的社交信息",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryView() {
    return Container(
      margin: const EdgeInsets.only(left: 14),
      child: Row(
        children: [
          ...List.generate(
            cateArr.length,
            (index) => Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      cateIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        cateArr[index],
                        style: TextStyle(
                            color: cateIndex == index
                                ? const Color(0xFF0E8AFD)
                                : const Color(0xFF333333),
                            fontSize: 16.w,
                            fontWeight: cateIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      const SizedBox(height: 2),
                      Opacity(
                        opacity: cateIndex == index ? 1 : 0,
                        child: Image.asset(
                          "assets/images/ic_switch_line.png",
                          width: 22,
                          height: 4,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 34)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget transferView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.47,
      decoration: BoxDecoration(
          color: const Color(0xFFF4F5F5),
          borderRadius: BorderRadius.circular(29)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                ),
                const Text(
                  "转赠闪卡",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 23),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/bg_transfer.png",
                    width: MediaQuery.of(context).size.width - 28,
                    height: 98,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, top: 16),
                  child: const Column(
                    children: [
                      Text(
                        "拥有卡牌",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      Text(
                        "28",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Text(
                    "接受ID",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF444444),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: "请输入",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8E8E8E),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/images/bg_detail_bottom_banner.png",
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "购买数量",
                    style: TextStyle(color: Color(0xFF666666), fontSize: 14),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (count > 0) {
                            setState(() {
                              count -= 1;
                            });
                          }
                        },
                        child: Image.asset(
                          "assets/images/down.png",
                          width: 36,
                          height: 36,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "$count",
                        style: const TextStyle(
                            color: Color(0xFF333333), fontSize: 16),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          setState(() {
                            count += 1;
                          });
                        },
                        child: Image.asset(
                          "assets/images/add_icon.png",
                          width: 36,
                          height: 36,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width - 106,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(colors: [
                  Color(0xFF027FFD),
                  Color(0xFF77EDFF),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              alignment: Alignment.center,
              child: const Text(
                "提交",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inComeProduct() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
          color: const Color(0xFFF4F5F5),
          borderRadius: BorderRadius.circular(29)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                ),
                const Text(
                  "分佣设置",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/ic_avator.png",
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "刘西瓜",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "ID：237457983",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF7B7B7B),
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  "assets/images/ic_idcopy.png",
                  width: 14,
                  height: 14,
                )
              ],
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  const Text(
                    "游戏分佣设置",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF444444),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Expanded(
                          child: TextField(
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: "请输入",
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF8E8E8E),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: const Text(
                            "%",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF444444),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              width: MediaQuery.of(context).size.width - 28,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "游戏分佣说明",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "用户在所有游戏娱乐获得的奖励服务费当中的分佣设置，比如用户获得100积分，服务费为10%，那么这个10%为你的100%来进行设置\n举例：设置比例为50%用户获得1000宝石X10%服务费=100服务费X10%平台抽取=90手续费90服务费X设置给下级用户50%服务费=下级获得50%，你获得50%下级获得：45你获得：45",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width - 106,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(colors: [
                  Color(0xFF027FFD),
                  Color(0xFF77EDFF),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              alignment: Alignment.center,
              child: const Text(
                "保存",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemProduct() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              "assets/images/bg_detail_bottom_banner.png",
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 130,
            height: 75,
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "城堡世界闪卡",
                  style: TextStyle(
                      color: Color(
                        0xFF333333,
                      ),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3FAFF),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "库存：124",
                    style: TextStyle(fontSize: 12, color: Color(0xFF0E8AFD)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "¥",
                          style:
                              TextStyle(color: Color(0xFFFF3B3B), fontSize: 12),
                        ),
                        Text(
                          "1499/张",
                          style: TextStyle(
                              color: Color(0xFFFF3B3B),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return transferView();
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 64,
                            height: 24,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFF0E8AFD),
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              "转赠",
                              style: TextStyle(
                                  color: Color(0xFF0E8AFD),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(width: 17),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return inComeProduct();
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 64,
                            height: 24,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF027FFD),
                                    Color(0xFF77EDFF),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: const Text(
                              "进货",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget storeManagerInfo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
          color: const Color(0xFFF4F5F5),
          borderRadius: BorderRadius.circular(29)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                ),
                const Text(
                  "我的店长信息",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 19),
                    child: Image.asset(
                      "assets/images/close.png",
                      width: 13,
                      height: 13,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Text(
                    "微信号",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF444444),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "请输入",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E8E),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Text(
                    "QQ号",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF444444),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "请输入",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8E8E8E),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "姓名",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF444444),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "下级用户将会通过姓名验证真实性",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8E8E8E),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "选择银行",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF444444),
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "请选择",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8E8E8E),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                "assets/images/ic_arrow_right.png",
                                width: 7,
                                height: 12,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        children: [
                          Text(
                            "银行卡",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF444444),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                hintText: "收款银行卡账户",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF8E8E8E),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: "留给下级店长的留言",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF8E8E8E),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  const Text(
                    "收款码",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(width: 31),
                  Image.asset(
                    "assets/images/ic_upload_alipay.png",
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(width: 18),
                  Image.asset(
                    "assets/images/ic_upload_wechat.png",
                    width: 80,
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: MediaQuery.of(context).size.width - 106,
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(colors: [
                  Color(0xFF027FFD),
                  Color(0xFF77EDFF),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              alignment: Alignment.center,
              child: const Text(
                "保存",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 21),
            const Text(
              "每月仅限修改两次，超过将收取20宝石",
              style: TextStyle(fontSize: 12, color: Color(0xFF8E8E8E)),
            ),
          ],
        ),
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
                      Container(
                        margin: EdgeInsets.only(left: 62.w),
                        child: const Text(
                          "店长中心",
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 88.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.w),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF027FFD),
                              Color(0xFF77EDFF),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Text(
                          "添加二级店长",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.w,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                headerView(),
                const SizedBox(height: 20),
                categoryView(),
                const SizedBox(height: 20),
                Expanded(
                  child: EasyRefresh(
                    onRefresh: () async {
                      return IndicatorResult.success;
                    },
                    onLoad: () async {
                      return IndicatorResult.success;
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          15,
                          (index) => Column(
                            children: [
                              itemProduct(),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 16),
                                width: MediaQuery.of(context).size.width - 28,
                                height: 0.5,
                                color: const Color(0xFFE1E1E1),
                              )
                            ],
                          ),
                        ),
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
