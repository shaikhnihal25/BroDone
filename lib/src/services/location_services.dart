import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocationService extends StatefulWidget {
  @override
  _LocationServiceState createState() => _LocationServiceState();
}

class _LocationServiceState extends State<LocationService> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    // Initialize location services
    checkLocationPermission();
    // Initialize notifications
    initializeNotifications();
  }

  Future<void> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
    }
    // Start listening for location changes
    Geolocator.getPositionStream(
            locationSettings: LocationSettings(
                accuracy: LocationAccuracy.high, distanceFilter: 10))
        .listen((Position position) {
      // Check if the student is inside the college campus
      if (isInsideCollegeCampus(position.latitude, position.longitude)) {
        sendNotification("Welcome to College", "You have entered the campus.");
      }
    });
  }

  bool isInsideCollegeCampus(double latitude, double longitude) {
    // Implement logic to check if the coordinates are inside the college campus.
    // You may need to define the college campus boundary.
    // For simplicity, let's assume a fixed coordinate range here.
    double campusLatitude = 12.34;
    double campusLongitude = 56.78;
    double radius = 0.01; // Define a radius for the campus boundary

    double distance = Geolocator.distanceBetween(
      latitude,
      longitude,
      campusLatitude,
      campusLongitude,
    );

    return distance <= radius;
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      //     onSelectNotification: (String? payload) async {
      //   // Handle notification tap here
      // });
    );
  }

  Future<void> sendNotification(String title, String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'college_location_notification', 'College Location Notification',
            // 'Channel for location-based notifications',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      platformChannelSpecifics,
      payload: 'location_payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Service Example'),
      ),
      body: Center(
        child: Text('Listening for location changes...'),
      ),
    );
  }
}
