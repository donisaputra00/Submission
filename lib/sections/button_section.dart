import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.bgColor,
    this.style,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final Color? bgColor;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 100,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 50,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
