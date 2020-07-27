import 'package:cloud_firestore/cloud_firestore.dart';

class TimeTableData {
  final databaseReference = Firestore.instance;

  Map<String, int> dayMappings = {
    'Mon': 0,
    'Tue': 1,
    'Wed': 2,
    'Thu': 3,
    'Fri': 4,
    'Sat': 5,
    'Sun': 6,
  };

  List<String> subjectIndices = [
    'subject1',
    'subject2',
    'subject3',
    'assignment'
  ];

  Future<List<String>> getSchedule(String day) async {
    List<String> schedule = [];
    databaseReference
        .collection('time-table')
        .document(day)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      for (var subjectIndex in subjectIndices) {
        schedule.add("${documentSnapshot.data[subjectIndex]}");
      }
//      print(schedule);
    });
    return schedule;
  }
}
