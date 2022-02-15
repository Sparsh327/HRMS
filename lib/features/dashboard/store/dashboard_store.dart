import 'package:mobx/mobx.dart';

import '../model/employee_model.dart';
import '../repo/dashboard_repo.dart';

part 'dashboard_store.g.dart';

class DashBoardStore = _DashBoardStore with _$DashBoardStore;

final _dashBoardRepo = DashBoardRepo();

abstract class _DashBoardStore with Store {
  Future<void> init() async {
    employeeList = ObservableStream(
      _dashBoardRepo.fetchCompayEmployees(),
      initialValue: [],
    );
  }

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
    await _dashBoardRepo.addEmployeeToDb(
      employeeDesignation: employeeDesignation,
      employeeEmail: employeeEmail,
      employeeName: employeeName,
      employeeSalary: employeeSalary,
      employeeJoiningDate: employeeJoiningDate!,
    );
  }

  late ObservableStream<List<EmployeeModel>> employeeList;
}
