import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'subject_card.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

Map<String, int> dayMapping = {
  'Monday': 0,
  'Tuesday': 1,
  'Wednesday': 2,
  'Thursday': 3,
  'Friday': 4,
  'Saturday': 5,
  'Sunday': 6,
};

class TabPage extends StatelessWidget {
  final String day;

  TabPage({@required this.day});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('time-table')
            .document(day)
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 21.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Classes ($day)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              RichText(
                                text: TextSpan(
                                  text: 'Attendance',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      final url = data['attendance'];
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SubjectCard(
                          subjectName: data['subject1'],
                          gradientColorTwo: kPinkOne,
                          gradientColorOne: kPurpleOne,
                          subjectTime: '8:00 - 8:50',
                        ),
                        SubjectCard(
                          subjectName: data['subject2'],
                          gradientColorTwo: kLightBlueTwo,
                          gradientColorOne: kDarkBlueTwo,
                          subjectTime: '9:00 - 9:50',
                        ),
                        SubjectCard(
                          subjectName: data['subject3'],
                          gradientColorTwo: kLightGreenThree,
                          gradientColorOne: kDarkGreenThree,
                          subjectTime: '10:00 - 10:50',
                        ),
                        SubjectCard(
                          subjectName: data['subject4'],
                          gradientColorTwo: kYellowFour,
                          gradientColorOne: kOrangeFour,
                          subjectTime: '11:00 - 11:50',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
//                        Padding(
//                          padding: const EdgeInsets.symmetric(
//                              vertical: 5.0, horizontal: 22.0),
//                          child: Text(
//                            'Assignments',
//                            style: TextStyle(
//                              fontWeight: FontWeight.w700,
//                              fontSize: 20.0,
//                            ),
//                          ),
//                        ),
//                        SubjectCard(
//                          subjectName: data['assignment'],
//                          cardColor: kDarkPurple,
//                          textColor: Colors.white,
//                          subjectTime: '8:00 - 9:00 a.m.',
//                          teacherName: 'Mrs. Vidyashree',
//                        ),
                      ],
                    );
                  },
                );
        });
  }
}
