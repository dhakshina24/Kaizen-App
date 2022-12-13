import 'package:flutter/material.dart';
import 'package:kaizen_app/tour_home/temp_sensor.dart';
import '../extensions/color.dart';
import '../helper/assets.dart';
import 'bp_sensor.dart';
import 'height.dart';

class WeightPage extends StatefulWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  State<WeightPage> createState() => WeightPageState();
}

class WeightPageState extends State<WeightPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.blueBackground,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width*0.95 ,
                height: MediaQuery.of(context).size.height,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  color: Colors.white,
                  Icons.arrow_left,
                  size: 40.0,
                ),
              ),
              Positioned(
                top: 5.0,
                left: 80.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "WEIGHT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "SENSOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: MediaQuery.of(context).size.width * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  child: Image.asset(
                    Assets.weightSensor,
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              Positioned(
                  left:MediaQuery.of(context).size.width*0.78,
                  top:30.0,
                  child: _buttonView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonView() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HeightPage()),
        );
      },
      child: Container(
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
