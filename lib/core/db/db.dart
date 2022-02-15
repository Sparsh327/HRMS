import 'package:hive_flutter/hive_flutter.dart';
import 'model/employee_auth.dart';

class DB {
  /// main hive [Box] box
  late Box _box;

  /// initialise database
  Future<void> init() async {
    // initialised models here
    Hive.registerAdapter(EmployeeAuthModelAdapter());
    // initialise database
    await Hive.initFlutter();

    // open hive box
    _box = await Hive.openBox('Minglewise');
  }

  final String _emloyeeAuthModel = 'employeeAuthModel';
  Future<void> addEmployeeAuthDetails(
    EmployeeAuthModel employeeAuthModel,
  ) async {
    await _box.put(_emloyeeAuthModel, employeeAuthModel);
  }

  EmployeeAuthModel? getEmployeeAuth() {
    return _box.get(_emloyeeAuthModel) as EmployeeAuthModel?;
  }

  Future<void> deleteEmployeeAuth() {
    return _box.delete(_emloyeeAuthModel);
  }
}

final db = DB();
