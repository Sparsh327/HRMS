import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../core/db/db.dart';
import '../../employee_dashboard/ui/employee_dashBoard.dart';
import '../store/login_store.dart';

class EmployeeLogin extends StatelessWidget {
  const EmployeeLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 8,
        ),
        children: const [_Body()],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/png/agile.png',
                width: 100,
              ),
              const Text(
                'You can login in your \ncompany portal',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "If you alredy have an account",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "You can",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      // print(MediaQuery.of(context).size.width);
                    },
                    child: const Text(
                      "Login here!",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height / 6,
          ),
          child: const SizedBox(width: 300, child: _FormFields()),
        ),
      ],
    );
  }
}

class _FormFields extends StatelessWidget {
  const _FormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);
    // ignore: unused_local_variable
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    );

    String email = '';
    String password = '';
    Future<bool?> showToast(String msg) {
      return Fluttertoast.showToast(
        msg: msg,
        textColor: Colors.white,
        webBgColor: 'linear-gradient(to right,#333333,#333333)',
        webPosition: 'center',
      );
    }

    return Column(
      children: [
        const SizedBox(height: 30),
        TextField(
          onChanged: (val) {
            email = val;
          },
          decoration: InputDecoration(
            hintText: 'Enter email or Phone number',
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
        const SizedBox(height: 30),
        Observer(
          builder: (_) {
            return TextField(
              onChanged: (val) {
                password = val;
              },
              obscureText: !loginStore.showPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: loginStore.showPassword
                      ? const Icon(Icons.visibility_rounded)
                      : const Icon(Icons.visibility_off_outlined),
                  color: Colors.grey,
                  onPressed: () {
                    loginStore.showPassword = !loginStore.showPassword;
                  },
                ),
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
            );
          },
        ),
        const SizedBox(height: 40),
        Observer(
          builder: (_) {
            if (loginStore.employeLoading) {
              return const CircularProgressIndicator();
            } else {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.deepPurple,
                      spreadRadius: 2,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    await loginStore.employeeLogin(
                      email: email,
                      password: password,
                    );
                    final auth = db.getEmployeeAuth();
                    if (auth == null) {
                      await showToast("Enter Valid Details");
                    } else {
                      // ignore: use_build_context_synchronously
                      await Navigator.pushAndRemoveUntil(
                        _,
                        MaterialPageRoute(
                          builder: (_) => EmpDashBoardScreen(
                            model: auth,
                          ),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text("Login")),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
