import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaizen_app/helper/themes.dart';
import 'package:kaizen_app/mental_health_survey_home/result_screen.dart';
import 'package:kaizen_app/mental_health_survey_home/survey.dart';
import 'package:kaizen_app/services/remote_services.dart';
import 'package:kaizen_app/tour_home/height.dart';
import 'package:kaizen_app/tour_home/scan_card.dart';
import 'package:kaizen_app/tour_home/temp_sensor.dart';
import 'package:kaizen_app/welcome_page.dart';

import 'mental_health_survey_home/begin_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaizen App',
      theme: theme,
      home: const WelcomePage(),
    );
  }
}
