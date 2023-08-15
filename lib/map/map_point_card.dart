import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/gen/assets.gen.dart';

class MapPointCard extends StatelessWidget {
  const MapPointCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.2625),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text('Truckee Office BOSS'),
                ),
                Text('1'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _PointCardCategory(name: 'Shipping', svgPath: Assets.svg.shipment),
                _PointCardCategory(name: 'Kiosk', svgPath: Assets.svg.kiosk),
                _PointCardCategory(name: 'Store', svgPath: Assets.svg.store),
                _PointCardCategory(name: 'Printing', svgPath: Assets.svg.print),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Phone: ',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff020202),
                    ),
                    children: [
                      TextSpan(text: '530-587-1620 opt.2'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    text: 'M - F: ',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff020202),
                    ),
                    children: [
                      TextSpan(text: '8:30 AM -5:00 PM'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    text: 'S: ',
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff020202),
                    ),
                    children: [
                      TextSpan(text: 'Closed'),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PointCardCategory extends StatelessWidget {
  const _PointCardCategory({
    required this.svgPath,
    required this.name,
    super.key,
  });

  final String svgPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgPath),
        const SizedBox(height: 4),
        Text(name),
      ],
    );
  }
}
