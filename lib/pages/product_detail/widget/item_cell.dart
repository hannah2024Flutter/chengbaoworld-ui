import 'package:flutter/material.dart';

class ItemCell extends StatefulWidget {
  final bool showBgColor;
  const ItemCell({super.key, required this.showBgColor});

  @override
  State<ItemCell> createState() => _ItemCellState();
}

class _ItemCellState extends State<ItemCell> {
  Widget contactCateView(
      String preImage, Color textColor, Color bg, String sufImage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 11),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/$preImage",
              width: 14,
              height: 14,
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 19),
      width: MediaQuery.of(context).size.width - 28,
      decoration: BoxDecoration(
        color: widget.showBgColor ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "金华市永康县",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "联系Ta",
                style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 12),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    contactCateView("ic_wechat.png", const Color(0xFF28C445),
                        const Color(0xFFECFCF0), "ic_wechat_copy.png"),
                    contactCateView("ic_qq.png", const Color(0xFF4F92FF),
                        const Color(0xFFECF7FC), "ic_qq_copy.png"),
                    const SizedBox(width: 4)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "店长",
                    style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 12),
                  ),
                  const SizedBox(width: 5),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      "assets/images/bg_detail_bottom_banner.png",
                      width: 22,
                      height: 22,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "壹诺社区1",
                    style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/images/ic_detail_location.png",
                    width: 11,
                    height: 12,
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    "263.3km",
                    style: TextStyle(color: Color(0xFF8E8E8E), fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
