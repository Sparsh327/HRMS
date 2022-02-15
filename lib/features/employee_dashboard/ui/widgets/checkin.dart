import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/db/db.dart';

class EmployeeCheckin extends StatefulWidget {
  const EmployeeCheckin({Key? key}) : super(key: key);

  @override
  State<EmployeeCheckin> createState() => _EmployeeCheckinState();
}

class _EmployeeCheckinState extends State<EmployeeCheckin> {
  DateTime? startTime;
  DateTime? endTime;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey[50],
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                ),
                child: Observer(
                  builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (startTime != null)
                          Text(
                            "Date :${startTime!.day}/${startTime!.month}/${startTime!.year}  Time:${startTime!.hour}:${startTime!.minute}",
                          )
                        else
                          const Text("Check In DateTime"),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              startTime = DateTime.now();
                            });
                          },
                          icon: const Icon(Icons.calendar_today),
                        )
                      ],
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  if (startTime != null) {
                    final empId = db.getEmployeeAuth()!.employeeId;
                    FirebaseFirestore.instance
                        .collection("listOfEmployees")
                        .doc(empId)
                        .collection('CheckIn')
                        .doc()
                        .set(
                      {"DateTime": startTime},
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 200,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Check In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontFamily: "Montserrat-Bold",
                        ),
                      ),
                      Icon(
                        Icons.hourglass_top,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey[50],
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                    ),
                    child: Observer(
                      builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (endTime != null)
                              Text(
                                "Date :${endTime!.day}/${endTime!.month}/${endTime!.year}  Time:${endTime!.hour}:${endTime!.minute}",
                              )
                            else
                              const Text("Check Out DateTime"),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  endTime = DateTime.now();
                                });
                              },
                              icon: const Icon(Icons.calendar_today),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  if (endTime != null) {
                    final empId = db.getEmployeeAuth()!.employeeId;
                    FirebaseFirestore.instance
                        .collection("listOfEmployees")
                        .doc(empId)
                        .collection('CheckOut')
                        .doc()
                        .set(
                      {"DateTime": endTime},
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 18),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 200,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Check Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1,
                          fontFamily: "Montserrat-Bold",
                        ),
                      ),
                      Icon(
                        Icons.hourglass_bottom,
                        size: 18,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
