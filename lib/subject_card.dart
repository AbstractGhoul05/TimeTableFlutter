import 'package:flutter/material.dart';
import 'constants.dart';

class SubjectCard extends StatelessWidget {
  final String subjectName;
  final Color gradientColorOne;
  final Color gradientColorTwo;
  final Color textColor;
  final String subjectTime;

  SubjectCard(
      {@required this.subjectName,
      this.gradientColorOne,
      this.gradientColorTwo,
      this.textColor = Colors.black,
      @required this.subjectTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//          color: cardColor,
//          gradient: LinearGradient(
////            colors: [gradientColorOne, gradientColorTwo],
////          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(
                2.0,
                2.0,
              ),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subjectName,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                kTeachersName[subjectName],
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
//              gradient: LinearGradient(
//                colors: [kBlueGradientTranslucent, kPurpleGradientTranslucent],
//              ),
              color: kBlueGradientTranslucent,
            ),
            child: Text(
              subjectTime,
              style: TextStyle(
                color: kBlueText,
                fontWeight: FontWeight.w600,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
