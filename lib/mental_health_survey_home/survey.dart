import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kaizen_app/extensions/color.dart';
import 'package:kaizen_app/mental_health_survey_home/result_screen.dart';
import '../extensions/color.dart';
import '../services/remote_services.dart';
import '../welcome_page.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int i = 0;
  final List<Questions> _surveyItems = [
    Questions(
        question: "Little interest or pleasure in doing things",
        answers: [
          Options(option: "Not at all", score: 0),
          Options(option: "Several days", score: 1),
          Options(option: "More than half the days", score: 2),
          Options(option: "Nearly every day", score: 3),
        ]),
    Questions(question: "Feeling down, depressed, or hopeless", answers: [
      Options(option: "Not at all", score: 0),
      Options(option: "Several days", score: 1),
      Options(option: "More than half the days", score: 2),
      Options(option: "Nearly every day", score: 3),
    ]),
    Questions(
        question: "Trouble falling or staying asleep, or sleeping too much",
        answers: [
          Options(option: "Not at all", score: 0),
          Options(option: "Several days", score: 1),
          Options(option: "More than half the days", score: 2),
          Options(option: "Nearly every day", score: 3),
        ]),
    Questions(question: "Feeling tired or having little energy", answers: [
      Options(option: "Not at all", score: 0),
      Options(option: "Several days", score: 1),
      Options(option: "More than half the days", score: 2),
      Options(option: "Nearly every day", score: 3),
    ]),
    Questions(question: "Poor appetite or overeating", answers: [
      Options(option: "Not at all", score: 0),
      Options(option: "Several days", score: 1),
      Options(option: "More than half the days", score: 2),
      Options(option: "Nearly every day", score: 3),
    ]),
    Questions(
        question:
            "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
        answers: [
          Options(option: "Not at all", score: 0),
          Options(option: "Several days", score: 1),
          Options(option: "More than half the days", score: 2),
          Options(option: "Nearly every day", score: 3),
        ]),
    Questions(
        question:
            "Trouble concentrating on things, such as reading the newspaper or watching television",
        answers: [
          Options(option: "Not at all", score: 0),
          Options(option: "Several days", score: 1),
          Options(option: "More than half the days", score: 2),
          Options(option: "Nearly every day", score: 3),
        ]),
    Questions(
        question:
            "Moving or speaking so slowly that other people could have noticed. Or the opposite being so fidgety or restless that you have been moving around a lot more than usual ",
        answers: [
          Options(option: "Not at all", score: 0),
          Options(option: "Several days", score: 1),
          Options(option: "More than half the days", score: 2),
          Options(option: "Nearly every day", score: 3),
        ]),
    Questions(
        question:
            "Thoughts that you would be better off dead, or of hurting yourself",
        answers: [
          Options(option: "Not at all", score: 0),
          Options(option: "Several days", score: 1),
          Options(option: "More than half the days", score: 2),
          Options(option: "Nearly every day", score: 3),
        ]),
  ];

  int _currentIndex = 0;
  int _finalScore = 0;
  int _selectedIndex = 0;
  bool validation = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       _currentIndex = _currentIndex - 1;
                          //       _finalScore = _finalScore -
                          //           _surveyItems[_currentIndex].answers[_selectedIndex].score;
                          //     });
                          //     if (_currentIndex < 0) {
                          //       _currentIndex = 0;
                          //       if (Navigator.canPop(context)) {
                          //         Navigator.pop(context);
                          //       }
                          //     }
                          //   },
                          //   child: const Icon(
                          //     Icons.arrow_back_ios_rounded,
                          //     size: 20.0,
                          //   ),
                          // ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.38,
                          ),
                          Row(
                            children: [
                              Text(
                                "${_currentIndex + 1}",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              const Text(
                                "of 9",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          _homeButton(),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      LinearProgressIndicator(
                        color: HexColor("#0078AA"),
                        backgroundColor: Colors.white,
                        value: (_currentIndex / 9),
                        minHeight: 10.0,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Expanded(
                        child: Text(
                          _surveyItems[_currentIndex].question,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.52,
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        _optionsItem(
                            option: _surveyItems[_currentIndex].answers[index],
                            chosenIndex: index),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 20.0),
                    itemCount: _surveyItems[_currentIndex].answers.length),
              ),
              const SizedBox(
                height: 20.0,
              ),
              validation?_buttonView():const SizedBox(width: 10.0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonView() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_currentIndex <= _surveyItems.length - 1) {
            _finalScore = _finalScore +
                _surveyItems[_currentIndex].answers[_selectedIndex].score;
            _currentIndex = _currentIndex + 1;
            validation = false;
            log(_finalScore.toString());
            if (_currentIndex == _surveyItems.length ) {
              _currentIndex =0;
              RemoteService().sendData(
                  jsonProperty: "mental_health_score",
                  data: _finalScore.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    score: _finalScore,
                  ),
                ),
              );
            }
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: 60.0,
        decoration: BoxDecoration(
          color: HexColor("#F2DF3A"),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            _currentIndex == _surveyItems.length - 1
                ? "RESULT"
                : "NEXT QUESTION",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _homeButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const WelcomePage()),
            (Route<dynamic> route) => false);
      },
      child: Container(
        width: 100.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: HexColor("#F2DF3A"),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Text(
            "HOME",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _optionsItem({required Options option, required int chosenIndex}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          option.isChecked = !option.isChecked;
          _selectedIndex = chosenIndex;
          validation = true;
          for (i = 0; (i < _surveyItems[_currentIndex].answers.length); i++) {
            if (i != chosenIndex) {
              _surveyItems[_currentIndex].answers[i].isChecked = false;
            }
          }
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 5.0,
            color: option.isChecked
                ? HexColor("#3AB4F2")
                : Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 30.0,
            ),
            Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: HexColor("#3AB4F2"),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(3.0),
                height: 20.0,
                width: 20.0,
                decoration: BoxDecoration(
                  color: option.isChecked ? HexColor("#3AB4F2") : Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              width: 50.0,
            ),
            Text(
              option.option,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Questions {
  final String question;
  final List<Options> answers;

  Questions({required this.question, required this.answers});
}

class Options {
  final String option;
  bool isChecked = false;
  int score = 0;

  Options({required this.option, required this.score});
}
