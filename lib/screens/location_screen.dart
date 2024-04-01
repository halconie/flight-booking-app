import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices extends StatefulWidget {
  const LocationServices({super.key});

  @override
  State<LocationServices> createState() => _LocationServicesState();
}

class _LocationServicesState extends State<LocationServices> {
  Position? currentPosition;

  Future<Position> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Location denied");
      LocationPermission ask = await Geolocator.requestPermission();
      if (ask == LocationPermission.denied ||
          ask == LocationPermission.deniedForever) {
        throw Exception("Location permission denied");
      }
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOS Geolocator"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: Material(
                borderRadius: BorderRadius.circular(30),
                shadowColor: Colors.black,
                elevation: 6,
                child: GestureDetector(
                  onTap: () {
                    getCurrentLocation().then((position) {
                      setState(() {
                        currentPosition = position;
                      });
                    }).catchError((error) {
                      print("Error: $error");
                    });
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 4.0,
                        color: Colors.blue, // Replace with your preferred color
                      ),
                    ),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 40,
                          ),

                          SizedBox(width: 10.0),

                          // Text
                          Center(
                              child: Text(
                                "Grab Geolocation",
                                style: TextStyle(fontSize: 20),
                              )),
                        ]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ), // Add some space between button and location display
            if (currentPosition != null)
              Column(
                children: [
                  const Text(
                    "Location:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18, // Adjust font size as needed
                    ),
                  ),
                  const SizedBox(
                      height:
                      10), // Add some space between "Location" text and actual location
                  Text(
                    "Latitude: ${currentPosition!.latitude.toString()}\nLongitude: ${currentPosition!.longitude.toString()}",
                    style: const TextStyle(
                      fontSize: 16, // Adjust font size as needed
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}