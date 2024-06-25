import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wheel_n_deal/Core/helpers/extensions.dart';
import 'package:wheel_n_deal/Core/networking/google%20map%20services/location_service.dart';
import 'package:wheel_n_deal/Core/networking/google%20map%20services/map_services.dart';
import 'package:wheel_n_deal/Core/routing/routes.dart';

import 'package:wheel_n_deal/Core/utils/assets.dart';
import 'package:wheel_n_deal/Core/utils/styles.dart';
import 'package:wheel_n_deal/Core/widgets/custom_main_button.dart';
import 'package:wheel_n_deal/constants.dart';

class UserTrackOrderViewBody extends StatefulWidget {
  const UserTrackOrderViewBody({super.key});

  @override
  State<UserTrackOrderViewBody> createState() => _UserTrackOrderViewBodyState();
}

class _UserTrackOrderViewBodyState extends State<UserTrackOrderViewBody> {
  late CameraPosition initialCameraPosition;
  late MapServices mapServices;
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  static const LatLng sourceLocation =
      LatLng(30.715955406355206, 31.24852084527862);
  static const LatLng destinationLocation =
      LatLng(30.786541739058805, 31.000364821862284);
  static const LatLng midLocation =
      LatLng(30.718025591617625, 31.192696500026326);
  List<LatLng> polylineCoordinates = [];
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  Set<Polyline> polylines = {};

  @override
  void initState() {
    mapServices = MapServices();
    initialCameraPosition = const CameraPosition(target: LatLng(0, 0));
    setCustomMarkerIcon();

    Marker sourceMarker = Marker(
      markerId: const MarkerId("source"),
      position: sourceLocation,
      icon: sourceIcon,
      infoWindow: const InfoWindow(title: "Source"),
    );

    Marker destinationMarker = Marker(
      markerId: const MarkerId("destination"),
      position: destinationLocation,
      icon: destinationIcon,
      infoWindow: const InfoWindow(title: "Destination"),
    );

    Marker midMarker = const Marker(
      markerId: MarkerId("mid"),
      position: midLocation,
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: "Mid Location"),
    );

    markers.add(sourceMarker);
    markers.add(midMarker);
    markers.add(destinationMarker);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Picking up your order",
                style: Styles.manropeExtraBold18.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GoogleMap(
                zoomControlsEnabled: true,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (controller) async {
                  googleMapController = controller;
                  await updateCurrentLocation();

                  if (mapServices.currentLocation != null) {
                    var points = await mapServices.getRouteData(
                      desination: destinationLocation,
                    );
                    mapServices.displayRoute(
                      points,
                      polylines: polylines,
                      googleMapController: googleMapController,
                    );
                    setState(() {});
                  } else {
                    // Handle the case where currentLocation is still null
                    print('Current location is not set.');
                  }
                },
                markers: markers,
                polylines: {
                  Polyline(
                    polylineId: const PolylineId("route"),
                    color: kPrimaryColor,
                    points: polylineCoordinates,
                    width: 5,
                  ),
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomMainButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 60,
                              height: 6,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFA3A3A3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                SizedBox(
                                  height: 64,
                                  child: Image.asset(
                                    AssetsData.profileImage,
                                  ),
                                ),
                                Positioned(
                                  bottom: -10,
                                  left: -1,
                                  right: -1,
                                  child: Card(
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "4.5",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const Spacer(),
                                          SvgPicture.asset(
                                            AssetsData.starIcon,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Ahmed is taking care of your order today",
                              style: Styles.manropeExtraBold18.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                context.pushNamed(Routes.kCommuterProfileSeenByUserFromTrackingView);
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "View profile",
                                  style: Styles.manropeExtraBold18.copyWith(
                                    fontSize: 16,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              text: "Chat",
              color: kPrimaryColor,
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getPolyPoints() async {
    var points = await mapServices.getRouteData(desination: destinationLocation);
    setState(() {
      polylineCoordinates.addAll(points);
    });
  }

  Future<void> updateCurrentLocation() async {
    try {
       mapServices.updateCurrentLocation(
        googleMapController: googleMapController,
        markers: markers,
        onUpdateCurrentLocation: () {
          setState(() {});
        }
      );
      setState(() {
        initialCameraPosition = CameraPosition(target: mapServices.currentLocation!, zoom: 14);
      });
    } on LocationServiceException {
      // handle the exception
    } on LocationPermissionException {
      // handle the exception
    } catch (e) {
      // handle the exception
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      AssetsData.sourceMarker,
    ).then((icon) {
      sourceIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      AssetsData.destinationMarker,
    ).then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      AssetsData.currentMarker,
    ).then((icon) {
      currentLocationIcon = icon;
    });
  }
}