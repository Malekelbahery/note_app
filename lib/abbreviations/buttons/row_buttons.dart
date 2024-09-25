import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
  const RowButton({
    super.key,
    this.onTap,
    this.height = 40,
    this.width = 200,
    this.backgroundColor = Colors.black,
    this.radius = 100,
    required this.widgets,
    this.typeAlignment = MainAxisAlignment.spaceEvenly,
    this.typeSize = MainAxisSize.max,
  });

  final void Function()? onTap;
  final double height;
  final double width;
  final Color backgroundColor;
  final double radius;
  final MainAxisAlignment typeAlignment;
  final List<Widget> widgets;
  final MainAxisSize typeSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Row(
          mainAxisSize: typeSize,
          mainAxisAlignment: typeAlignment,
          children: widgets,
        ),
      ),
    );
  }
}
