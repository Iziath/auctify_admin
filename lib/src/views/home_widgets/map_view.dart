import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Carte d'observation")),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(6.4092498, 1.8685113),
          initialZoom: 11,
          interactionOptions:
              InteractionOptions(flags: ~InteractiveFlag.doubleTapZoom),
        ),
        children: [
          openStreetMapTileLayer,
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(6.4092498, 1.8685113),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
              Marker(
                point: LatLng(6.290581, 1.7973851),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
              Marker(
                point: LatLng(6.320581, 1.8973851),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
              Marker(
                point: LatLng(6.5029098, 1.8685113),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
              Marker(
                point: LatLng(6.280581, 1.8373851),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
              Marker(
                point: LatLng(6.360581, 1.7873851),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
              Marker(
                point: LatLng(6.330501, 1.8573851),
                child: Icon(Icons.location_pin, size: 30, color: Colors.red),
              ),
            ],
          )
        ],
        // children: [
        //   // openStreetMapTileLayer,
        //   RichAttributionWidget(
        //     popupInitialDisplayDuration: const Duration(seconds: 5),
        //     animationConfig: const ScaleRAWA(),
        //     showFlutterMapAttribution: false,
        //     attributions: [
        //       TextSourceAttribution(
        //         'OpenStreetMap contributors',
        //         onTap: () async => launchUrl(
        //           Uri.parse(
        //               'https://www.openstreetmap.org/#map=12/6.3530209/2.3949526'),
        //         ),
        //       ),
        //       const TextSourceAttribution(
        //         'This attribution is the same throughout this app, except '
        //         'where otherwise specified',
        //         prependCopyright: false,
        //       ),
        //     ],
        //   ),
        // ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
      userAgentPackageName: "dev.fleaflet.flutter_map.example",
    );
