import 'package:flutter/material.dart';
import 'package:flutter_dtt/core/constants.dart';
import 'package:flutter_dtt/core/presentation/card_details_widget.dart';
import 'package:flutter_dtt/core/presentation/price_widget.dart';
import 'package:flutter_dtt/core/utils/dimens.dart';
import 'package:flutter_dtt/home/domain/model/house_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide MapType;
import 'package:map_launcher/map_launcher.dart';

class DetailScreen extends StatefulWidget {
  final HouseModel houseModel;

  const DetailScreen({super.key, required this.houseModel});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Set<Marker> markers = {};
  late LatLng showLocation;
  GoogleMapController? controller;

  @override
  void initState() {
    showLocation =
        LatLng(widget.houseModel.latitude, widget.houseModel.longitude);
    markers.add(
      Marker(
          markerId: MarkerId(showLocation.toString()),
          position: showLocation,
          infoWindow: const InfoWindow(title: 'house address'),
          icon: BitmapDescriptor.defaultMarker,
          onTap: () {
            MapLauncher.showDirections(
              mapType: MapType.google,
              destination: Coords(
                  widget.houseModel.latitude, widget.houseModel.longitude),
            );
          }),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.network(
              Constants.baseUrl + widget.houseModel.image,
              height: MediaQuery.of(context).size.height * 0.36,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.largeXX),
                  topRight: Radius.circular(Dimens.largeXX),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Dimens.large),
                      child: Row(
                        children: [
                          PriceWidget(price: widget.houseModel.price),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: Dimens.largeXX),
                              child: CardDetailsWidget(
                                  houseModel: widget.houseModel),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: Dimens.medium),
                        Text(
                          widget.houseModel.description,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 14,fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: Dimens.small),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.32,
                          child: GoogleMap(
                            zoomGesturesEnabled: true,
                            initialCameraPosition:
                                CameraPosition(target: showLocation, zoom: 13),
                            markers: markers,
                            onMapCreated: (controller){
                              this.controller = controller;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
