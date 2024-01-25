import 'package:castleworld/pages/product_detail/all_contact_store_manager.dart';
import 'package:castleworld/pages/product_detail/widget/item_cell.dart';
import 'package:flutter/material.dart';

class ContactStoreManager extends StatefulWidget {
  const ContactStoreManager({super.key});

  @override
  State<ContactStoreManager> createState() => _ContactStoreManagerState();
}

class _ContactStoreManagerState extends State<ContactStoreManager> {
  Widget allStoreManager() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AllContactStoreManager()),
            );
          },
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19),
              gradient: const LinearGradient(colors: [
                Color(0xFF027FFD),
                Color(0xFF77EDFF),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: const Text(
              "查看全部店长",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: 76,
          height: 24,
          decoration: BoxDecoration(
              color: const Color(0xFFE9F6FF),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/ic_detail_refresh.png",
                width: 12,
                height: 12,
              ),
              const SizedBox(width: 2),
              const Text(
                "刷新位置",
                style: TextStyle(fontSize: 12, color: Color(0xFF0E8AFD)),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F5),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Image.asset(
            "assets/images/bg_detail_contact.png",
            width: 288,
            height: 30,
          ),
          const SizedBox(height: 9),
          allStoreManager(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    8,
                    (index) => Container(
                      margin: const EdgeInsets.only(top: 14),
                      child: const ItemCell(showBgColor: true)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
