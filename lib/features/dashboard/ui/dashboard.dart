import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Dashboard"),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("listOFEmployees")
                  .doc()
                  .set({
                "emaiid": "sparsh.jas@gmail.com",
                "companyName": "djdj",
                // "companyId": FirebaseAuth.instance.currentUser!.uid
              });
            },
            child: const Text("Add Users"),
          ),
        ],
      ),
    );
  }
}
