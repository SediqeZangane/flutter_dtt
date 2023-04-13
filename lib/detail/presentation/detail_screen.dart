import 'package:flutter/material.dart';
import 'package:flutter_dtt/core/constants.dart';
import 'package:flutter_dtt/core/presentation/card_details_widget.dart';
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
        onTap: (){
          MapLauncher.showDirections(
            mapType: MapType.google,
            destination: Coords(widget.houseModel.latitude,
                widget.houseModel.longitude),
          );
        }
      ),
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
              child:
                  Image.network(Constants.baseUrl + widget.houseModel.image)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text("\$${widget.houseModel.price}",
                            style: Theme.of(context).textTheme.titleMedium),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: CardDetailsWidget(
                                houseModel: widget.houseModel),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.houseModel.description,
                          style: Theme.of(context).textTheme.bodySmall,
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
                        const SizedBox(height: 16),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.33,
                          child: GoogleMap(
                            zoomGesturesEnabled: true,
                            initialCameraPosition:
                                CameraPosition(target: showLocation, zoom: 13),
                            markers: markers,
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
}
