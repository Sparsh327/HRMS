import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../model/employee_model.dart';

class DashBoardRepo {
  Future<void> addEmployeeToDb({
    required String employeeEmail,
    required String employeeName,
    required String employeeSalary,
    required DateTime employeeJoiningDate,
    required String employeeDesignation,
  }) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('listOfEmployees').add({
      "employeeName": employeeName,
      "employeeEmail": employeeEmail,
      "employeeSalary": employeeSalary,
      "employeeJoinDate": employeeJoiningDate,
      "employeeDesignation": employeeDesignation,
      "companyId": uid
    }).then((value) {
      FirebaseFirestore.instance
          .collection('listOfCompanies')
          .doc(uid)
          .collection("companiesEmployee")
          .doc(value.id)
          .set({
        "employeeName": employeeName,
        "employeeEmail": employeeEmail,
        "employeeSalary": employeeSalary,
        "employeeJoinDate": employeeJoiningDate,
        "employeeDesignation": employeeDesignation,
        "companyId": uid
      });
      sendCredentials(
        email: employeeEmail,
        name: employeeName,
        subject: "Employee Login Credentials",
        message: "Email Id $employeeEmail Password ${value.id}",
      );
    });
  }

  Future<void> sendCredentials({
    required String email,
    required String name,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_vtd4gga';
    const templateId = 'template_ylr68fm';
    const userId = 'user_h7dWI3BCYwyo3cZEvCN95';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'to_email': email,
          'user_name': name,
          'user_subject': subject,
          'user_message': message,
        },
      }),
    );
    // ignore: avoid_print
    print(response.body);
  }

  Stream<List<EmployeeModel>> fetchCompayEmployees() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection("listOfCompanies")
        .doc(uid)
        .collection("companiesEmployee")
        .snapshots()
        .map(
          (event) => event.docs.map(EmployeeModel.fromMap).toList(),
        );
  }
}
