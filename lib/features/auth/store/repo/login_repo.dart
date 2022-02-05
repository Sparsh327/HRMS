import 'package:cloud_firestore/cloud_firestore.dart';

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
}
