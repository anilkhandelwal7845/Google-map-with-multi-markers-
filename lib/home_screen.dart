import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGoohleplex = CameraPosition(
    target: LatLng(24.625497133166697, 73.6796470992265),
    zoom: 13,
  );

  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(24.625497133166697, 73.6796470992265),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(24.59177345376494, 73.65215733906024),
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(24.587095568974032, 73.68625511207632),
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(24.595437257395442, 73.66497487583186),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGoohleplex,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
