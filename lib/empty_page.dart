import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String day;

  EmptyPage({@required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 30.0),
      child: Center(
        child: Text(
          'You have no classes on this day!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

