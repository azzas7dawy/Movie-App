import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  static const routeName = '/map_screen';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Controller to manage the map
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // Initial camera position (e.g., Cairo, Egypt)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(30.0444, 31.2357),
    zoom: 14.0,
  );

  // Set of markers to display on the map
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Add markers to the set
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('cairo_marker'),
          position: const LatLng(30.0444, 31.2357),
          infoWindow: const InfoWindow(
            title: 'Cairo',
            snippet: 'The heart of Egypt',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );

      _markers.add(
        Marker(
          markerId: const MarkerId('giza_marker'),
          position: const LatLng(29.9792, 31.1342), // Giza Pyramids
          infoWindow: const InfoWindow(
            title: 'Giza Pyramids',
            snippet: 'A wonder of the world',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map with Markers'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        markers: _markers, // Pass the set of markers here
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}