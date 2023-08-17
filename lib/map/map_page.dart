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
  bool _isPageViewAnimating = false;

  late ValueNotifier<int> selectedItem = ValueNotifier(-1)
    ..addListener(() {
      _isPageViewAnimating = true;
      _pageController
          .animateToPage(selectedItem.value, duration: const Duration(milliseconds: 500), curve: Curves.linear)
          .then((value) => _isPageViewAnimating = false);
      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: _mapObjects[selectedItem.value].point.latitude,
              longitude: _mapObjects[selectedItem.value].point.longitude,
            ),
          ),
        ),
        animation: const MapAnimation(duration: 1),
      );
    });

  late final _mapObjects = [
    PlacemarkMapObject(
      mapId: const MapObjectId('1'),
      point: const Point(latitude: 59.945933, longitude: 30.320045),
      opacity: 0.7,
      direction: 90,
      onTap: (mapObject, point) => selectedItem.value = 0,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(Assets.images.point.path),
          rotationType: RotationType.noRotation,
        ),
      ),
      text: const PlacemarkText(
        text: '1',
        style: PlacemarkTextStyle(
          offsetFromIcon: false,
          placement: TextStylePlacement.top,
          offset: -4,
          size: 12,
        ),
      ),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('2'),
      point: const Point(latitude: 60, longitude: 31),
      opacity: 0.7,
      direction: 90,
      onTap: (mapObject, point) => selectedItem.value = 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(Assets.images.point.path),
          rotationType: RotationType.noRotation,
        ),
      ),
      text: const PlacemarkText(
        text: '2',
        style: PlacemarkTextStyle(
          offsetFromIcon: false,
          placement: TextStylePlacement.top,
          offset: -4,
          size: 12,
        ),
      ),
    ),
    PlacemarkMapObject(
      mapId: const MapObjectId('3'),
      point: const Point(latitude: 60.5, longitude: 30.5),
      opacity: 0.7,
      direction: 90,
      onTap: (mapObject, point) => selectedItem.value = 2,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(Assets.images.point.path),
          rotationType: RotationType.noRotation,
        ),
      ),
      text: const PlacemarkText(
        text: '3',
        style: PlacemarkTextStyle(
          offsetFromIcon: false,
          placement: TextStylePlacement.top,
          offset: -4,
          size: 12,
        ),
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
                selectedItem.value = 0;
              },
              mapObjects: _mapObjects,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: SizedBox(
                  height: 270,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      if (_isPageViewAnimating) {
                        return;
                      }
                      selectedItem.value = value;
                    },
                    controller: _pageController,
                    clipBehavior: Clip.none,
                    itemCount: _mapObjects.length,
                    itemBuilder: (context, index) => Padding(
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
                        child: MapPointCard(id: (index + 1).toString()),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
