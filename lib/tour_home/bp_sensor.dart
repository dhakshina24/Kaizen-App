import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kaizen_app/mental_health_survey_home/survey.dart';
import 'package:kaizen_app/tour_home/remove_sensors.dart';
import 'package:kaizen_app/tour_home/temp_sensor.dart';
import 'package:kaizen_app/tour_home/weight.dart';

import '../extensions/color.dart';
import '../helper/assets.dart';
import '../mental_health_survey_home/begin_page.dart';
import '../welcome_page.dart';

class BpPage extends StatefulWidget {
  const BpPage({Key? key}) : super(key: key);

  @override
  State<BpPage> createState() => BpPageState();
}

class BpPageState extends State<BpPage> {
  final List<String> _assetItems = [
    Assets.bpSensor,
    Assets.useBpSensor,
    Assets.buttonBpSensor,
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: SizedBox(
          child: Stack(
            children: [
              Image.asset(
                Assets.blueBackground,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
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
                left: 25.0,
                top: 5.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "BLOOD",
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
                      "PRESSURE",
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
              Align(
                alignment: const Alignment(0.25,0.35),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.65,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        enableInfiniteScroll: false,
                      ),
                      itemCount: _assetItems.length,
                      itemBuilder: (context, index, realIndex) {
                        final imageName = _assetItems[index];
                        return _contentView(assetName: imageName);
                      }),
                ),
              ),
              Align(
                alignment: const Alignment(0.1, 0.85),
                child: _indicatorView(),
              ),
              Align(
                  alignment: const Alignment(0.9,-0.75),
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
          MaterialPageRoute(builder: (context) => const SensorsOff()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 300.0,
          left: 40.0,
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

  Widget _contentView({required String assetName}) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 5.0,
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            children: "STEP ${_currentIndex + 1}"
                .split("")
                .map(
                  (string) => Text(
                string,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            )
                .toList(),
          ),
        ),
        const SizedBox(width: 20.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            30.0,
          ),
          child: Image.asset(
            assetName,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget _indicatorView() {
    return SizedBox(
      height: 15.0,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            width: 15.0,
            height: 15.0,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? HexColor("#0078AA")
                  : Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(7.5),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 5.0),
          itemCount: _assetItems.length),
    );
  }
}
