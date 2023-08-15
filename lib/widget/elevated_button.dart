import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.horizontalPadding,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final double? width;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontalPadding == null ? width : null,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
          backgroundColor: AppColors.primaryRed,
          disabledBackgroundColor: Colors.grey,
          disabledForegroundColor: Colors.white,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
