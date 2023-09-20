import 'package:flutter/material.dart';

class Attendance {
  final String date;
  final bool isPresent;

  Attendance({required this.date, required this.isPresent});
}

class AttendanceProvider extends ChangeNotifier {
  List<Attendance> _attendanceRecords = [];

  List<Attendance> get attendanceRecords => _attendanceRecords;

  void addAttendanceRecord(Attendance attendance) {
    _attendanceRecords.add(attendance);
    notifyListeners();
  }

  void removeAttendanceRecord(String date) {
    _attendanceRecords.removeWhere((record) => record.date == date);
    notifyListeners();
  }
}
