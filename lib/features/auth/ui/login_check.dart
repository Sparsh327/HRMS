import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/db/db.dart';
import '../../dashboard/ui/dashboard.dart';
import '../../employee_dashboard/ui/employee_dashboard.dart';
import '../../landing_page/landing_page.dart';
import '../store/login_store.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({Key? key}) : super(key: key);

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  @override
  void initState() {
    super.initState();

    Provider.of<LoginStore>(context, listen: false)
        .isAlreadyAuthenticated(context)
        .then((value) {
      if (value) {
        // print(value);
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const DashBoardScreen()),
          (route) => false,
        );
      } else {
        // print("result is false");
        final employeeAuth = db.getEmployeeAuth();
        if (employeeAuth != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => EmpDashBoardScreen(
                model: employeeAuth,
              ),
            ),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => const LandingPage(),
            ),
            (route) => false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
