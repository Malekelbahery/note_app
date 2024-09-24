import 'package:flutter/material.dart';

class PerfectButton extends StatelessWidget {
  const PerfectButton(
      {super.key,
      this.width = 150,
      this.height = 40,
      this.radius = 100,
      this.buttonColor = Colors.black,
      this.title = 'Button',
      this.titleSize = 25,
      this.titleColor = Colors.white, this.onTap});

  final double width;
  final double height;
  final double radius;
  final Color buttonColor;
  final String title;
  final double titleSize;
  final Color titleColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              color: buttonColor),
          child: Text(
            title,
            style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: titleColor),
          ),
        ),
      ),
    );
  }
}
