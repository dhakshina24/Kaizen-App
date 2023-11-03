import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kaizen_app/extensions/color.dart';
import 'package:kaizen_app/services/remote_services.dart';
import 'package:kaizen_app/tour_home/scan_card.dart';
import 'helper/assets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    _resetVariable();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset(
                Assets.frontPage,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.95,
                fit: BoxFit.fill,
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.55,
                  left: MediaQuery.of(context).size.width * 0.39,
                  child: _optionsView()),
            ],
          ),
        ),
      ),
    );
  }

  void _resetVariable() {
    RemoteService().sendData(data: "0", jsonProperty: "stop_signal");
  }

  Color _hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget _optionsView() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScanCardPage()));
          },
          child: Container(
            margin: const EdgeInsets.only(
              left: 35.0,
            ),
            padding: const EdgeInsets.all(10.0,),
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                width: 5.0,
                color: HexColor("#0078AA"),
              ),
            ),
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                color: HexColor("#F2DF3A"),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Center(
                child: Text(
                  "BEGIN",
                  style: TextStyle(
                    color: HexColor("#0078AA"),
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // RemoteService().sendData(data: "1", jsonProperty: "stop_signal");
            SystemNavigator.pop();
          },
          child: Container(
            margin: const EdgeInsets.only(
              left: 200.0,
            ),
            padding: const EdgeInsets.all(10.0,),
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              border: Border.all(
                width: 5.0,
                color: HexColor("#E22C34"),
              ),
            ),
            child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                color: HexColor("#F2DF3A"),
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(1, 3),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child:  Center(
                child: Text(
                  "FINISH",
                  style: TextStyle(
                    color: HexColor("#E22C34"),
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
