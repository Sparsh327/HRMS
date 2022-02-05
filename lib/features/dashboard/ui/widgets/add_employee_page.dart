import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../store/dashboard_store.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardStore = Provider.of<DashBoardStore>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      // child:
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider.value(
                    value: dashboardStore,
                    child: const AddEmployeeScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.person_add),
          )
        ],
      ),
    );
  }
}

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            const _EmployeeName(),
            const Spacer(),
            const _EmployeeEmail(),
            const Spacer(),
            const _EmployeePosition(),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _EmployeeSalary(),
                  SizedBox(
                    width: 5,
                  ),
                  _EmployeeJoiningDate(),
                ],
              ),
            ),
            const Spacer(),
            const AddEmployeeButton(),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmployeeName extends StatelessWidget {
  const _EmployeeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DashBoardStore>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: GestureDetector(
        child: TextField(
          onChanged: (val) {
            store.employeeName = val;
          },
          decoration: InputDecoration(
            hintText: 'Name',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmployeePosition extends StatelessWidget {
  const _EmployeePosition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DashBoardStore>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        onChanged: (val) {
          store.employeeDesignation = val;
        },
        decoration: InputDecoration(
          hintText: 'Desigination',
          filled: true,
          fillColor: Colors.blueGrey[50],
          labelStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class _EmployeeEmail extends StatelessWidget {
  const _EmployeeEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DashBoardStore>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: TextField(
        onChanged: (val) {
          store.employeeEmail = val;
        },
        decoration: InputDecoration(
          hintText: 'Employee Email',
          filled: true,
          fillColor: Colors.blueGrey[50],
          labelStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class _EmployeeJoiningDate extends StatelessWidget {
  const _EmployeeJoiningDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DashBoardStore>(context);

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        store.employeeJoiningDate = picked;
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.17,
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
              if (store.employeeJoiningDate != null)
                Text(
                  "${store.employeeJoiningDate!.day}/${store.employeeJoiningDate!.month}/${store.employeeJoiningDate!.year}",
                )
              else
                const Text("Joining Date"),
              IconButton(
                onPressed: () {
                  _selectDate(context);
                },
                icon: const Icon(Icons.calendar_today),
              )
            ],
          );
        },
      ),
    );
  }
}

class _EmployeeSalary extends StatelessWidget {
  const _EmployeeSalary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<DashBoardStore>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.17,
      child: TextField(
        onChanged: (val) {
          store.employeeSalary = val;
        },
        decoration: InputDecoration(
          hintText: 'Salary per month',
          filled: true,
          fillColor: Colors.blueGrey[50],
          labelStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

class AddEmployeeButton extends StatelessWidget {
  const AddEmployeeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardStore = Provider.of<DashBoardStore>(context);
    Future sendEmail({
      required String email,
      required String name,
      required String subject,
      required String message,
    }) async {
      final serviceId = 'service_vtd4gga';
      final templateId = 'template_ylr68fm';
      final userId = 'user_h7dWI3BCYwyo3cZEvCN95';
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'to_email': email,
            'user_name': name,
            'user_subject': subject,
            'user_message': message,
          },
        }),
      );
      print(response.body);
    }

    return ElevatedButton(
      onPressed: () {
        dashboardStore.addEmployee();
        Navigator.pop(context);
        // sendEmail(
        //   email: "sparsh.jas07@gmail.com",
        //   name: "ddd",
        //   subject: "eede",
        //   message: "dee",
        // );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurple,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const SizedBox(
        width: 100,
        height: 50,
        child: Center(child: Text("Add Employee")),
      ),
    );
  }
}
