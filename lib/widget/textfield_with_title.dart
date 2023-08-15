import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    required this.text,
    required this.controller,
    this.obscureText = false,
    this.isRequired = false,
    this.isBold = false,
    this.haveError = false,
    this.keyboardType,
    this.onChange,
    this.errorMessage,
    this.maxLength,
    this.textInputAction,
    this.onEditingComplete,
    super.key,
  });

  final String text;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isRequired;
  final bool isBold;
  final ValueChanged<String>? onChange;
  final VoidCallback? onEditingComplete;
  final bool haveError;
  final String? errorMessage;
  final int? maxLength;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: isRequired ? '*' : '',
            style: const TextStyle(color: AppColors.primaryRed),
            children: [
              TextSpan(
                text: text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: isBold ? FontWeight.bold : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(241, 249, 255, 1),
            border: Border.all(color: haveError ? Colors.red : Colors.black),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: TextField(
              maxLength: maxLength,
              onChanged: onChange,
              obscureText: obscureText,
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onEditingComplete: onEditingComplete,
              decoration: const InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        if (haveError) ...[
          const SizedBox(height: 8),
          Text(
            errorMessage ?? '',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryRed,
            ),
          )
        ]
      ],
    );
  }
}
