import 'package:flutter/material.dart';
import 'package:kaizen_app/tour_home/sensors_on.dart';
import 'package:kaizen_app/tour_home/weight.dart';
import '../extensions/color.dart';
import '../helper/assets.dart';
import '../models/device.dart';
import '../services/remote_services.dart';

class ScanCardPage extends StatefulWidget {
  const ScanCardPage({Key? key}) : super(key: key);

  @override
  State<ScanCardPage> createState() => ScanCardPageState();
}

class ScanCardPageState extends State<ScanCardPage> {
  Device? rfidResponse;
  String scannedCard="rfid_true";

  @override
  void initState() {
    super.initState();
   // loadedData();
  }

  // loadedData() async {
  //   while (scannedCard == "rfid_false") {
  //     debugPrint("response");
  //     rfidResponse = await RemoteService().fetchDevice();
  //     setState((){
  //       debugPrint(rfidResponse?.c8YSupportedOperations[0]);
  //       scannedCard = rfidResponse?.c8YSupportedOperations[0] ?? " ";
  //       debugPrint(rfidResponse?.c8YSupportedOperations[0]);
  //     });
  //   }
  //   setState((){
  //     scannedCard = rfidResponse?.c8YSupportedOperations[0] ?? " ";
  //   });
  // }

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
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                Assets.scanCard,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
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
              scannedCard == "rfid_true"
                  ? _buttonView()
                  : const SizedBox(
                      width: 1.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonView() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SensorsOn()),
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
