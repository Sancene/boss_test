import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/gen/assets.gen.dart';
import 'package:untitled/utils/colors.dart';

class MapPointCard extends StatelessWidget {
  const MapPointCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
          child: Row(
            children: [
              _MapButton(text: 'Drive'),
              SizedBox(width: 16),
              Expanded(
                child: _MapButton(
                  text: 'Truckee, CA',
                  isSelected: true,
                ),
              ),
              SizedBox(width: 16),
              _MapButton(text: 'Details'),
            ],
          ),
        ),
        const SizedBox(height: 19),
        DecoratedBox(
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
                      child: Text(
                        'Truckee Office BOSS',
                        style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontFamily: "Arial",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
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
        ),
      ],
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

class _MapButton extends StatelessWidget {
  const _MapButton({
    required this.text,
    this.isSelected = false,
    super.key,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppColors.primaryRed,
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
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Arial",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.black : Colors.white,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
