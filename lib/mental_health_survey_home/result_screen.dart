import 'package:flutter/material.dart';
import 'package:kaizen_app/extensions/color.dart';

import '../helper/assets.dart';
import '../services/remote_services.dart';
import '../welcome_page.dart';

class ResultPage extends StatefulWidget {
  final int score;

  const ResultPage({Key? key, required this.score}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  Assets.reachOut,
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _displayScore(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  _displaySeverity(),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Align(
                      alignment: const Alignment(0.75, 1),
                      child: _buttonView()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _displaySeverity() {
    return Container(
      margin: const EdgeInsets.only(
        right: 30.0,
      ),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: HexColor("#164c61"),
          width: 5,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
        ),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          border: Border.all(
            color: HexColor("#95bbbe"),
            width: 5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: Text(
                "DEPRESSION SEVERITY",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Text(
                _calcSeverity(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "SCORE",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 70.0,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 50.0,
            right: 100.0,
          ),
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75.0),
            border: Border.all(
              width: 5.0,
              color: HexColor("#164c61"),
            ),
          ),
          child: Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(75.0),
              border: Border.all(
                width: 5.0,
                color: HexColor("#95bbbe"),
              ),
            ),
            child: Center(
              child: Text(
                "${widget.score}/27",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _calcSeverity() {
    if (widget.score >= 0 && widget.score <= 4) {
      return "None";
    } else if (widget.score >= 5 && widget.score <= 9) {
      return "Mild";
    } else if (widget.score >= 10 && widget.score <= 14) {
      return "Moderate";
    } else if (widget.score >= 15 && widget.score <= 19) {
      return "Moderately Severe";
    } else if (widget.score >= 20 && widget.score <= 27) {
      return "Severe";
    }
    return "Not Calculated";
  }

  Widget _buttonView() {
    return InkWell(
      onTap: () {
        RemoteService().sendData(
            jsonProperty: "depression_severity", data: _calcSeverity());

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WelcomePage()),
            (Route<dynamic> route) => false);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 80.0,
        decoration: BoxDecoration(
          color: HexColor("#F2DF3A"),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Text(
            "BACK TO HOME",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 25.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
