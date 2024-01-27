import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @author hannah
/// @email hannah.wang@fortex.com
/// @version V1.0
/// @date 10/10/22 18:51
/// @description switch widget

class SwitchTypeWidget extends StatefulWidget {
  const SwitchTypeWidget({
    Key? key,
    this.marginSpacing,
    this.containerWidth,
    this.containerHeight,
    this.backgroundColor,
    this.selectedColorForLeft,
    this.selectedColorForRight,
    this.selectedTabTextStyle,
    this.unSelectedTabTextStyle,
    this.leftTitle,
    this.rightTitle,
    this.borderRadius,
    this.outlineColor,
    this.outlineWidth,
    this.defaultSelected,
    required this.typeSelectChange,
    this.isCanSelectLeftTab,
    this.isCanSelectRightTab,
  }) : super(key: key);

  @override
  createState() => _SwitchTypeWidgetState();

  final double? marginSpacing;
  final double? containerWidth;
  final double? containerHeight;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? selectedColorForLeft;
  final Color? selectedColorForRight;
  final Color? outlineColor;
  final double? outlineWidth;
  final TextStyle? selectedTabTextStyle;
  final TextStyle? unSelectedTabTextStyle;
  final String? leftTitle;
  final String? rightTitle;
  final int? defaultSelected;
  final Function(int) typeSelectChange;
  final bool? isCanSelectLeftTab;
  final bool? isCanSelectRightTab;
}

class _SwitchTypeWidgetState extends State<SwitchTypeWidget> {
  int typeIndex = 0;

  @override
  void initState() {
    super.initState();

    ///set default
    typeIndex = widget.defaultSelected ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    var contentSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? const Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius ?? 18.5.r),
          bottomRight: Radius.circular(widget.borderRadius ?? 18.5.r),
          topRight: Radius.circular(widget.borderRadius ?? 18.5.r),
          bottomLeft: Radius.circular(widget.borderRadius ?? 18.5.r),
        ),
        border: Border.all(
            color: widget.outlineColor ?? (widget.backgroundColor ?? const Color(0xffffffff)),
            width: widget.outlineWidth ?? 0.0),
      ),
      width: widget.containerWidth ?? contentSize.width - 14.w * 2,
      height: widget.containerHeight ?? 37,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if ((widget.isCanSelectLeftTab ?? true) == true) {
                  setState(() {
                    typeIndex = 0;
                  });
                  widget.typeSelectChange.call(typeIndex);
                } else {
                  widget.typeSelectChange.call(0);
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: widget.marginSpacing ?? 2.h,
                    bottom: widget.marginSpacing ?? 2.h,
                    left: widget.marginSpacing ?? 2.w),
                decoration: BoxDecoration(
                  gradient: typeIndex == 0
                      ? const LinearGradient(colors: [
                          Color(0xff027FFD),
                          Color(0xff779DFF),
                        ])
                      : const LinearGradient(colors: [
                          Color(0xffffffff),
                          Color(0xffffffff),
                        ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 18.5.r),
                  ),
                ),
                child: Text(
                  widget.leftTitle ?? '暂无',
                  style: typeIndex == 0
                      ? widget.selectedTabTextStyle ??
                          TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )
                      : widget.unSelectedTabTextStyle ??
                          TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 14.sp,
                          ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if ((widget.isCanSelectRightTab ?? true) == true) {
                  setState(() {
                    typeIndex = 1;
                  });
                  widget.typeSelectChange.call(typeIndex);
                } else {
                  widget.typeSelectChange.call(1);
                }
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: widget.marginSpacing ?? 2.h,
                    bottom: widget.marginSpacing ?? 2.h,
                    right: widget.marginSpacing ?? 2.w),
                decoration: BoxDecoration(
                  gradient: typeIndex == 1
                      ? const LinearGradient(colors: [
                          Color(0xff027FFD),
                          Color(0xff779DFF),
                        ])
                      : const LinearGradient(colors: [
                          Color(0xffffffff),
                          Color(0xffffffff),
                        ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widget.borderRadius ?? 18.5.r),
                  ),
                ),
                child: Text(
                  widget.rightTitle ?? '暂无',
                  style: typeIndex == 1
                      ? widget.selectedTabTextStyle ??
                          TextStyle(
                            color: const Color(0xFFFFFFFF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )
                      : widget.unSelectedTabTextStyle ??
                          TextStyle(
                            color: const Color(0xFF333333),
                            fontSize: 14.sp,
                          ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
