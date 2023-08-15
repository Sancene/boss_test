import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/form/bloc/form_bloc.dart';
import 'package:untitled/form/widget/form_page.dart';
import 'package:untitled/gen/assets.gen.dart';
import 'package:untitled/map/map_point_card.dart';
import 'package:untitled/utils/colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late YandexMapController _controller;
  late final PageController _pageController = PageController(viewportFraction: 0.9);

  final _mapObjects = [
    PlacemarkMapObject(
      mapId: const MapObjectId('1'),
      point: const Point(latitude: 59.945933, longitude: 30.320045),
      opacity: 0.7,
      direction: 90,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(Assets.images.point.path), rotationType: RotationType.noRotation),
      ),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('2'),
      point: const Point(latitude: 60, longitude: 31),
      opacity: 0.7,
      direction: 90,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(Assets.images.point.path), rotationType: RotationType.noRotation),
      ),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('3'),
      point: const Point(latitude: 60.5, longitude: 30.5),
      opacity: 0.7,
      direction: 90,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(Assets.images.point.path), rotationType: RotationType.noRotation),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'The Office BOSS Locations',
          style: TextStyle(
            fontFamily: "Arial",
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            height: 16 / 16,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          SizedBox(
            width: 40,
            height: 40,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.svg.faq),
            ),
          ),
        ],
        backgroundColor: AppColors.primaryRed,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            YandexMap(
              tiltGesturesEnabled: false,
              rotateGesturesEnabled: false,
              onMapCreated: (controller) {
                _controller = controller;
                _controller.moveCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: Point(
                        latitude: _mapObjects.first.point.latitude,
                        longitude: _mapObjects.first.point.longitude,
                      ),
                    ),
                  ),
                );
              },
              mapObjects: _mapObjects,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        children: const [
                          _MapButton(text: 'Drive'),
                          SizedBox(width: 16),
                          _MapButton(text: 'Truckee, CA', isSelected: true),
                          SizedBox(width: 16),
                          _MapButton(text: 'Details'),
                          SizedBox(width: 16),
                          _MapButton(text: 'Something else'),
                          SizedBox(width: 16),
                          _MapButton(text: 'Something else 2'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 19),
                    SizedBox(
                      height: 210,
                      child: PageView(
                        onPageChanged: (value) {
                          _controller.moveCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: Point(
                                  latitude: _mapObjects[value].point.latitude,
                                  longitude: _mapObjects[value].point.longitude,
                                ),
                              ),
                            ),
                            animation: const MapAnimation(duration: 1),
                          );
                        },
                        controller: _pageController,
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) => FormBloc(),
                                    child: const FormPage(),
                                  ),
                                ),
                              ),
                              child: const MapPointCard(),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: MapPointCard(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: MapPointCard(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 16 + (isSelected ? 32 : 0), vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Arial",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isSelected ? Colors.black : Colors.white,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
