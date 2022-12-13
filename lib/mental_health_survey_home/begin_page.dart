import 'package:flutter/material.dart';
import 'package:kaizen_app/helper/assets.dart';
import 'package:kaizen_app/mental_health_survey_home/survey.dart';

import '../extensions/color.dart';
import '../welcome_page.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({Key? key}) : super(key: key);

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  color: Colors.black,
                  Icons.arrow_left,
                  size: 50.0,
                ),
              ),
            ),
            const SizedBox(height: 100.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 500.0,
                  height: 500.0,
                  decoration: BoxDecoration(
                    color: HexColor("#3AB4F2").withOpacity(0.5),
                    borderRadius: BorderRadius.circular(250.0),
                    border: Border.all(width: 5.0,
                      color: HexColor("#0078AA"),
                    ),
                  ),
                  child: Image.asset(
                    Assets.survey,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "PLEASE PRESS NEXT",
                          style: TextStyle(
                            color: HexColor("#0078AA"),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        Text(
                          "TO FILL OUT THE",
                          style: TextStyle(
                            color: HexColor("#0078AA"),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        Text(
                          "MENTAL HEALTH SURVEY",
                          style: TextStyle(
                            color: HexColor("#0078AA"),
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SurveyPage()));
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
                    ),
                    const SizedBox(height: 20.0,),
                   GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const WelcomePage()),
                            (Route<dynamic> route) => false);
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
                            "BACK TO HOME",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
