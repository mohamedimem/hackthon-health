import 'package:flutter/material.dart';
import 'dart:math';

class SearchController {
  void openView() {
    // Implement the openView functionality here
  }
}

class SearchAnchor extends StatelessWidget {
  final Function(BuildContext, SearchController) builder;
  final Function(BuildContext, SearchController) suggestionsBuilder;

  const SearchAnchor({
    required this.builder,
    required this.suggestionsBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final SearchController controller = SearchController();

    return builder(context, controller);
  }
}

class SearchBar extends StatelessWidget {
  final SearchController controller;
  final MaterialStatePropertyAll<EdgeInsets> padding;
  final Function() onTap;
  final Function(dynamic) onChanged;
  final Widget leading;

  const SearchBar({
    required this.controller,
    required this.padding,
    required this.onTap,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // Implement the SearchBar UI here
        );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({Key? key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  List<Marker> markers = [];
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Bar Sample')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/map.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Display markers on the map
            ...markers.map((marker) {
              // Convert latitude and longitude to screen coordinates
              double left = (marker.longitude + 180.0) *
                  MediaQuery.of(context).size.width /
                  360.0;
              double top = (90.0 - marker.latitude) *
                  MediaQuery.of(context).size.height /
                  180.0;

              return Positioned(
                left: left,
                top: top,
                child: Icon(
                  Icons.location_on,
                  size: 30,
                  color: Colors.red, // Set your desired marker color
                ),
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Generate a marker with a random position and label
          double lat = random.nextDouble() * 90; // Random latitude
          double lng = random.nextDouble() * 180; // Random longitude
          String item = 'Random Marker';
          setState(() {
            markers.clear(); // Clear existing markers
            markers.add(Marker(lat, lng, item));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Marker {
  final double latitude;
  final double longitude;
  final String label;

  Marker(this.latitude, this.longitude, this.label);
}
