import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashBoardStore = _DashBoardStore with _$DashBoardStore;

// final _dateGossipRepo = DateGossipRepo();

abstract class _DashBoardStore with Store {
  @observable
  int index = 0;

  @observable
  String employeeName = '';
  @observable
  String employeeDesignation = '';
  @observable
  String employeeEmail = '';
  @observable
  String employeeSalary = '';
  @observable
  DateTime? employeeJoiningDate;
  @observable
  bool updateEmployee = false;
  @action
  Future<void> addEmployee() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance.collection('listOfEmployees').add({
      "employeeName": employeeName,
      "employeeEmail": employeeEmail,
      "employeeSalary": employeeSalary,
      "employeeJoinDate": employeeJoiningDate,
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
        "companyId": uid
      });
    });
  }
}
