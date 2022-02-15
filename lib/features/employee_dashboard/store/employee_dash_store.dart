import 'package:mobx/mobx.dart';

part 'employee_dash_store.g.dart';

class EmployeeDashBoardStore = _EmployeeDashBoardStore
    with _$EmployeeDashBoardStore;

// final _dashBoardRepo = DashBoardRepo();

abstract class _EmployeeDashBoardStore with Store {
  Future<void> init() async {
    // employeeList = ObservableStream(
    //   _dashBoardRepo.fetchCompayEmployees(),
    //   initialValue: [],
    // );
  }

  @observable
  int index = 0;
}
