import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class Technicien {
  int id;
  String name;
  double latitude;
  double longitude;
  Technicien({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

List<Technicien> technicianList = [
  Technicien(id: 1, name: "user1", latitude: 48.862725, longitude: 2.281598),
  Technicien(id: 2, name: "user2", latitude: 48.862725, longitude: 2.283595),
  Technicien(id: 3, name: "user3", latitude: 48.862725, longitude: 2.285581),
];

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  List<Marker> markerList = technicianList
      .map(
        (tech) => Marker(
          markerId: MarkerId(tech.id.toString()),
          position: LatLng(tech.latitude, tech.longitude),
          infoWindow: InfoWindow(title: tech.name),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        ),
      )
      .toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        markers: Set<Marker>.of(markerList),
        initialCameraPosition: CameraPosition(
          target: LatLng(48.862725, 2.287592),
          zoom: 15,
        ),
      ),
    );
  }
}
