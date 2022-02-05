// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashBoardStore on _DashBoardStore, Store {
  final _$indexAtom = Atom(name: '_DashBoardStore.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$employeeNameAtom = Atom(name: '_DashBoardStore.employeeName');

  @override
  String get employeeName {
    _$employeeNameAtom.reportRead();
    return super.employeeName;
  }

  @override
  set employeeName(String value) {
    _$employeeNameAtom.reportWrite(value, super.employeeName, () {
      super.employeeName = value;
    });
  }

  final _$employeeDesignationAtom =
      Atom(name: '_DashBoardStore.employeeDesignation');

  @override
  String get employeeDesignation {
    _$employeeDesignationAtom.reportRead();
    return super.employeeDesignation;
  }

  @override
  set employeeDesignation(String value) {
    _$employeeDesignationAtom.reportWrite(value, super.employeeDesignation, () {
      super.employeeDesignation = value;
    });
  }

  final _$employeeEmailAtom = Atom(name: '_DashBoardStore.employeeEmail');

  @override
  String get employeeEmail {
    _$employeeEmailAtom.reportRead();
    return super.employeeEmail;
  }

  @override
  set employeeEmail(String value) {
    _$employeeEmailAtom.reportWrite(value, super.employeeEmail, () {
      super.employeeEmail = value;
    });
  }

  final _$employeeSalaryAtom = Atom(name: '_DashBoardStore.employeeSalary');

  @override
  String get employeeSalary {
    _$employeeSalaryAtom.reportRead();
    return super.employeeSalary;
  }

  @override
  set employeeSalary(String value) {
    _$employeeSalaryAtom.reportWrite(value, super.employeeSalary, () {
      super.employeeSalary = value;
    });
  }

  final _$employeeJoiningDateAtom =
      Atom(name: '_DashBoardStore.employeeJoiningDate');

  @override
  DateTime? get employeeJoiningDate {
    _$employeeJoiningDateAtom.reportRead();
    return super.employeeJoiningDate;
  }

  @override
  set employeeJoiningDate(DateTime? value) {
    _$employeeJoiningDateAtom.reportWrite(value, super.employeeJoiningDate, () {
      super.employeeJoiningDate = value;
    });
  }

  final _$updateEmployeeAtom = Atom(name: '_DashBoardStore.updateEmployee');

  @override
  bool get updateEmployee {
    _$updateEmployeeAtom.reportRead();
    return super.updateEmployee;
  }

  @override
  set updateEmployee(bool value) {
    _$updateEmployeeAtom.reportWrite(value, super.updateEmployee, () {
      super.updateEmployee = value;
    });
  }

  final _$addEmployeeAsyncAction = AsyncAction('_DashBoardStore.addEmployee');

  @override
  Future<void> addEmployee() {
    return _$addEmployeeAsyncAction.run(() => super.addEmployee());
  }

  @override
  String toString() {
    return '''
index: ${index},
employeeName: ${employeeName},
employeeDesignation: ${employeeDesignation},
employeeEmail: ${employeeEmail},
employeeSalary: ${employeeSalary},
employeeJoiningDate: ${employeeJoiningDate},
updateEmployee: ${updateEmployee}
    ''';
  }
}
