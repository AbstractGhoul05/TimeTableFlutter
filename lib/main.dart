import 'package:flutter/material.dart';
import 'constants.dart';
import 'tab_page.dart';
import 'empty_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: DefaultTabController(
        length: 7,
        initialIndex: DateTime.now().weekday - 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [kBlueGradientFinal, kPurpleGradientFinal],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      'Mon',
                      style: kTabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Tue',
                      style: kTabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Wed',
                      style: kTabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Thu',
                      style: kTabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Fri',
                      style: kTabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sat',
                      style: kTabTextStyle,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sun',
                      style: kTabTextStyle,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              title: Text(
                'Time Table',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              elevation: 0.0,
              backgroundColor: Colors.transparent,
//              flexibleSpace: Container(
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    colors: [kAppBarOne, kAppBarTwo],
//                  ),
//                ),
//              ),
            ),
            body: TabBarView(
              children: <Widget>[
                TabPage(
                  day: 'Monday',
                ),
                TabPage(
                  day: 'Tuesday',
                ),
                TabPage(
                  day: 'Wednesday',
                ),
                TabPage(
                  day: 'Thursday',
                ),
                TabPage(
                  day: 'Friday',
                ),
                EmptyPage(
                  day: 'Saturday',
                ),
                EmptyPage(
                  day: 'Sunday',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
