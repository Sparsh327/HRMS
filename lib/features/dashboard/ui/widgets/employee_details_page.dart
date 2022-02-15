import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../model/employee_model.dart';

class EmployeeDetailsWidget extends StatelessWidget {
  const EmployeeDetailsWidget({required this.model, Key? key})
      : super(key: key);
  final EmployeeModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              height: 300,
              width: 400,
              child: model == null
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 30,
                              child: Text(model!.employeeName[0].toUpperCase()),
                            ),
                          ),
                          Text("Name:- ${model!.employeeName}"),
                          const Divider(),
                          Text("Email:- ${model!.employeeEmail}"),
                          const Divider(),
                          Text("Designation:- ${model!.employeeDesignation}"),
                          const Divider(),
                          Text("Salary:- ${model!.employeeSalary}"),
                          const Divider(),
                          Text(
                            "Joining Date:- ${model!.employeeJoiningDate}",
                          ),
                          const Divider(),
                          Text("EmployeeId:- ${model!.employeeId}")
                        ],
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text("Check In Time"),
                  Text("Check Out Time"),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              height: 200,
              width: 600,
              child: Row(
                children: [
                  DailyCheckinWidget(model: model!),
                  DailyCheckOutWidget(model: model!)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DailyCheckinWidget extends StatefulWidget {
  const DailyCheckinWidget({required this.model, Key? key}) : super(key: key);
  final EmployeeModel model;
  @override
  State<DailyCheckinWidget> createState() => _DailyCheckinWidgetState();
}

class _DailyCheckinWidgetState extends State<DailyCheckinWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("listOfEmployees")
          .doc(widget.model.employeeId)
          .collection("CheckIn")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot doc = snapshot.data!.docs[index];
                  final checkin = (doc['DateTime'] as Timestamp).toDate();
                  return Column(
                    children: [
                      Text(
                        "Date:- ${checkin.day}/${checkin.month}/${checkin.year}  Time:-  ${checkin.hour}:${checkin.minute}",
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
          );
        } else {
          return const Text("No data");
        }
      },
    );
  }
}

class DailyCheckOutWidget extends StatelessWidget {
  const DailyCheckOutWidget({required this.model, Key? key}) : super(key: key);
  final EmployeeModel model;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("listOfEmployees")
          .doc(model.employeeId)
          .collection("CheckOut")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 200,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot doc = snapshot.data!.docs[index];
                  final checkin = (doc['DateTime'] as Timestamp).toDate();
                  return Column(
                    children: [
                      Text(
                        "Date:- ${checkin.day}/${checkin.month}/${checkin.year}  Time:-  ${checkin.hour}:${checkin.minute}",
                      ),
                      const Divider()
                    ],
                  );
                },
              ),
            ),
          );
        } else {
          return const Text("No data");
        }
      },
    );
  }
}
