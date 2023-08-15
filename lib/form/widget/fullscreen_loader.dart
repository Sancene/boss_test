import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/colors.dart';

class Loader extends StatelessWidget {
  const Loader({this.addTopPadding = false, super.key});

  final bool addTopPadding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: addTopPadding ? const EdgeInsets.only(top: 3) : EdgeInsets.zero,
        child: Center(
          child: Platform.isIOS
              ? const CupertinoActivityIndicator(
                  color: AppColors.primaryRed,
                  radius: 16,
                )
              : const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.primaryRed,
                ),
        ),
      );
}

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          height: 88,
          width: 88,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Loader(),
        ),
      );
}

void showFullScreenLoader(BuildContext context) => unawaited(
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => const FullScreenLoader(),
      ),
    );
