// lib/screens/flight_info_screen.dart
import 'package:flutter/material.dart';
import '../aviation_api.dart';

class FlightInfoScreen extends StatelessWidget {
  const FlightInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flight Info'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: AviationApi().getFlightData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var flightData = snapshot.data!['data'];
            return ListView.builder(
              itemCount: flightData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Flight ${flightData[index]['flight']['iata']}'),
                  subtitle: Text('From ${flightData[index]['departure']['airport']} to ${flightData[index]['arrival']['airport']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}