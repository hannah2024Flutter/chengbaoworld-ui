import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 2;
  Widget tagView(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFF3B3B)),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xFFFF3B3B),
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sprintLeftView() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 16,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF027FFD),
          Color(0xFF77EDFF),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(2),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: const Text(
        "闪卡",
        style: TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget sprintRightView() {
    return Container(
      alignment: Alignment.centerRight,
      width: 60,
      height: 16,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF118DFD),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(2),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Transform.translate(
        offset: const Offset(-4, 0),
        child: const Text(
          "自营",
          style: TextStyle(
              color: Color(0xFF128EFE),
              fontSize: 10,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buttonComponent(String text, Color start, Color end) {
    return Container(
      width: (MediaQuery.of(context).size.width - 100)/2,   
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          start,
          end,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget bottomRow() {
    return Container(
      padding: const EdgeInsets.only(top: 6),
      width: double.infinity,
      height: MediaQuery.of(context).padding.bottom + 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30,top: 5),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/contact.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(height: 4),
                const Text(
                  "客服",
                  style: TextStyle(
                    color: Color(
                      0xFF222222,
                    ),
                    fontSize: 9,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 11),
            child: Row(
              children: [
                buttonComponent(
                    "出售", const Color(0xFFFF7316), const Color(0xFFFFAB31)),
                const SizedBox(width: 14),
                InkWell(
                  onTap: () {
                    buyEvent();
                  },
                  child: buttonComponent(
                      "立即购买", const Color(0xFF027FFD), const Color(0xFF77EDFF)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buyEvent() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return buyPopup();
      },
    );
  }

  Widget buyPopup() {
    return Container(
      height: 450,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 19),
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
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    "assets/images/bg_detail_bottom_banner.png",
                    width: 91,
                    height: 91,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 140,
                  height: 91,
                  margin: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "塞哥维亚古堡",
                        style: TextStyle(
                            color: Color(
                              0xFF333333,
                            ),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              sprintRightView(),
                              sprintLeftView(),
                            ],
                          ),
                          const Text(
                            "包含：7张闪卡",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 12),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Transform.translate(
                                offset: const Offset(0, -3),
                                child: const Text(
                                  "¥",
                                  style: TextStyle(
                                      color: Color(0xFFFF3B3B), fontSize: 12),
                                ),
                              ),
                              const Text(
                                "19.9",
                                style: TextStyle(
                                    color: Color(0xFFFF3B3B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Text(
                            "单位：1套",
                            style: TextStyle(
                                color: Color(0xFF666666), fontSize: 12),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 14),
              Text(
                "单次可购买一套",
                style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
              ),
              SizedBox(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  2,
                  (index) => Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(12)),
                    width: (MediaQuery.of(context).size.width - 42) / 2,
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            "assets/images/bg_detail_bottom_banner.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          height: 50,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "基础城堡",
                                style: TextStyle(
                                    color: Color(
                                      0xFF333333,
                                    ),
                                    fontSize: 14),
                              ),
                              Text(
                                "1个",
                                style: TextStyle(
                                    color: Color(0xFF0E8AFD),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 14),
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 130,
                  height: 54,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF0E8AFD)),
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: const Text(
                    "在线购买",
                    style: TextStyle(
                        color: Color(0xFF0E8AFD),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 246,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    gradient: const LinearGradient(colors: [
                      Color(0xFF027FFD),
                      Color(0xFF77EDFF),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: const Text(
                    "联系店长购买",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/bg_detail_banner.png",
                    width: double.infinity,
                    height: 375,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 13),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    padding: const EdgeInsets.only(
                        left: 16, top: 14, bottom: 11, right: 16),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -7),
                              child: const Text(
                                "¥",
                                style: TextStyle(
                                    color: Color(0xFFFF3B3B), fontSize: 16),
                              ),
                            ),
                            const Text(
                              "179323.00",
                              style: TextStyle(
                                  color: Color(0xFFFF3B3B),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const SizedBox(height: 7),
                        Row(
                          children: [
                            tagView("官方自营"),
                            const SizedBox(width: 9),
                            tagView("免运费"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    padding: const EdgeInsets.only(
                        left: 16, top: 14, bottom: 21, right: 16),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "城堡世界卡城堡世界卡城堡世界卡城堡世界卡",
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 13),
                        Stack(
                          children: [
                            sprintRightView(),
                            sprintLeftView(),
                          ],
                        ),
                        const SizedBox(height: 15),
                        CustomPaint(
                          painter: DashedLinePainter(),
                          child: Container(),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "关于作者",
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 7),
                        const Text(
                          "城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡城堡世界如何开卡",
                          style:
                              TextStyle(color: Color(0xFF595959), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: const Text(
                            "图文详情",
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          "assets/images/bg_detail_bottom_banner.png",
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottomRow(),
          )
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF979797)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 5;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
