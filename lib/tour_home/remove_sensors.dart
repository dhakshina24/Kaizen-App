import 'package:flutter/material.dart';
import 'package:kaizen_app/mental_health_survey_home/begin_page.dart';
import 'package:kaizen_app/tour_home/weight.dart';

import '../extensions/color.dart';
import '../helper/assets.dart';

class SensorsOff extends StatefulWidget {
  const SensorsOff({Key? key}) : super(key: key);

  @override
  State<SensorsOff> createState() => _SensorsOffState();
}

class _SensorsOffState extends State<SensorsOff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Center(
              child: Image.asset(
                Assets.sensorsOff,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width*0.75,
                height: MediaQuery.of(context).size.height*0.85,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    color: Colors.black,
                    Icons.arrow_left,
                    size: 50.0,
                  ),
                ),
              ],
            ),

            _buttonView()

          ],
        ),
      ),
    );
  }

  Widget _buttonView() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BeginPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          right: 20.0,
        ),
        height: 80.0,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
          color: HexColor("#F2DF3A"),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Text(
            "NEXT",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
