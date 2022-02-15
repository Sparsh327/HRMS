import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'employee_auth.g.dart';

@HiveType(typeId: 0)
class EmployeeAuthModel extends HiveObject {
  EmployeeAuthModel({
    required this.employeeId,
    required this.companyId,
  });
  factory EmployeeAuthModel.fromFirebase(DocumentSnapshot snap) {
    return EmployeeAuthModel(
      employeeId: snap.id,
      companyId: snap["companyId"].toString(),
    );
  }

  @HiveField(0)
  String employeeId;

  @HiveField(1)
  String companyId;
}
