import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  EmployeeModel({
    required this.companyId,
    required this.employeeEmail,
    required this.employeeId,
    required this.employeeJoiningDate,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeDesignation,
  });

  factory EmployeeModel.fromMap(DocumentSnapshot snap) {
    snap.data();
    return EmployeeModel(
      companyId: snap["companyId"] as String,
      employeeEmail: snap["employeeEmail"] as String,
      employeeId: snap.id,
      // ignore: avoid_dynamic_calls
      employeeJoiningDate: snap["employeeJoinDate"].toDate() as DateTime,
      employeeName: snap["employeeName"] as String,
      employeeSalary: snap["employeeSalary"] as String,
      employeeDesignation: snap["employeeDesignation"] as String,
    );
  }
  String employeeEmail;
  String employeeName;
  String employeeSalary;
  String employeeId;
  String companyId;
  DateTime employeeJoiningDate;
  String employeeDesignation;
}
