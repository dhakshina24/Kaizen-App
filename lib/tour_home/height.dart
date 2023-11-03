import 'package:flutter/material.dart';
import 'package:kaizen_app/services/remote_services.dart';
import 'package:kaizen_app/tour_home/temp_sensor.dart';
import '../extensions/color.dart';
import '../helper/assets.dart';
import '../models/device.dart';
import 'bp_sensor.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => HeightPageState();
}

class HeightPageState extends State<HeightPage> {
  var heightController = TextEditingController();
  double bmi = 0.0;
  double height = 0.0;


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.blueTriangle,
                  fit: BoxFit.fill,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.55,
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
                        "HEIGHT",
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
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * 0.25,
                  left: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 75.0,
                        ),
                        Text(
                          "PLEASE ENTER YOUR HEIGHT (IN CM)",
                          style: TextStyle(
                            color: HexColor("#0078AA"),
                            fontSize: 35.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: HexColor("#0078AA"),
                          ),
                          height: 50.0,
                          child: TextField(
                            controller: heightController,
                            autocorrect: false,
                            enableSuggestions: false,
                            cursorColor: Colors.white,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20.0,
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: "Enter Height (cm)",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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

  void _loadData() async {
    var response = await RemoteService().fetchDevice();
    setState(() {
     bmi = double.parse(response.weight);
    });
  }

  Widget _buttonView() {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TempPage()),
          );
          setState(() {
            height = double.parse(heightController.text);
            bmi = (bmi/(height*height))*10000;
          });
          RemoteService().sendData(data:bmi.toString(),jsonProperty:"bmi");
          RemoteService().sendData(data:heightController.text,jsonProperty:"height");
        },
        child:Container(
          margin: const EdgeInsets.only(
            bottom: 300.0,
            left: 40.0,
          ),
          height: 80.0,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.2,
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
        ),);
    //     heightController.text==""
    //     ? const SizedBox(height: 10.0,)
    //     : Container(
    //   margin: const EdgeInsets.only(
    //     bottom: 300.0,
    //     left: 40.0,
    //   ),
    //   height: 80.0,
    //   width: MediaQuery
    //       .of(context)
    //       .size
    //       .width * 0.2,
    //   decoration: BoxDecoration(
    //     color: HexColor("#F2DF3A"),
    //     borderRadius: BorderRadius.circular(10.0),
    //   ),
    //   child: const Center(
    //     child: Text(
    //       "NEXT",
    //       style: TextStyle(
    //         color: Colors.black,
    //         fontWeight: FontWeight.bold,
    //         fontSize: 28.0,
    //       ),
    //       textAlign: TextAlign.center,
    //     ),
    //   ),
    // ),);
  }
}
