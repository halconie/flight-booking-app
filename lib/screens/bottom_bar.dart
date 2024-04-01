import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'ticket_screen.dart';
import 'location_screen.dart';
import 'account_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  double shakeThresholdGravity = 10;
  double acceleration = 0.00;
  double currentAcceleration = 0.00;
  double lastAcceleration = 0.00;

  static final List<Widget>_widgetOptions = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const LocationServices(),
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      updateAcceleration(event);
    });
  }

  void updateAcceleration(AccelerometerEvent event) {
    double x = event.x;
    double y = event.y;
    double z = event.z;

    lastAcceleration = currentAcceleration;
    currentAcceleration = sqrt(x * x + y * y + z * z);
    double delta = currentAcceleration - lastAcceleration;
    acceleration = acceleration * 0.9 + delta; // perform low-cut filter

    if (acceleration > shakeThresholdGravity) {
      // device is being shaken
      print("Device is being shaken");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Device is being shaken'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _widgetOptions[_selectedIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: "Ticket"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_location_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_location_filled),
              label: "Location"),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile")
        ],
      ),
    );
  }
}