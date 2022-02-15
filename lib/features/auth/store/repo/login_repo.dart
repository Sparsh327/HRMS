import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/db/db.dart';
import '../../../../core/db/model/employee_auth.dart';

class LoginRepository {
  Future<void> uploadOneTimeLoginDetail({
    required String name,
    required String email,
    required String id,
    required String nameOfCompany,
  }) async {
    await FirebaseFirestore.instance.collection("listOfCompanies").doc(id).set({
      "email": email,
      "nameOfOwner": name,
      "companyId": id,
      "nameOfCompany": nameOfCompany
    });
  }

  Future<void> authenticateEmployee({
    required String id,
  }) async {
    final snap = await FirebaseFirestore.instance
        .collection("listOfEmployees")
        .doc(id)
        .get();
    await db.addEmployeeAuthDetails(EmployeeAuthModel.fromFirebase(snap));
  }
}
