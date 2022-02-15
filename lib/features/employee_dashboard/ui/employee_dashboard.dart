import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../../core/db/db.dart';
import '../../../core/db/model/employee_auth.dart';
import '../../auth/ui/login_check.dart';
import '../store/employee_dash_store.dart';
import 'widgets/checkin.dart';

class EmpDashBoardScreen extends StatelessWidget {
  const EmpDashBoardScreen({
    required this.model,
    Key? key,
  }) : super(key: key);
  final EmployeeAuthModel model;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => EmployeeDashBoardStore(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          backgroundColor: Colors.indigo[900],
          actions: [
            InkWell(
              onTap: () {
                db.deleteEmployeeAuth();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const CheckLogin()),
                  (route) => false,
                );
              },
              child: Row(
                children: const [
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontFamily: "Montserrat-Bold",
                    ),
                  ),
                  Icon(
                    Icons.login,
                    size: 18,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
        body: const EmpDashBoardNavBar(),
      ),
    );
  }
}

class EmpDashBoardNavBar extends StatelessWidget {
  const EmpDashBoardNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<EmployeeDashBoardStore>(context);
    final List<Widget> views = [
      Center(
        child: Column(
          children: [
            const Text('Dashboard'),
            TextButton(
              onPressed: () {
                // FirebaseFirestore.instance.collection("Leave").doc().set({"name":"cc",});
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
      // const AddEmployeePage(),
      const Center(
        child: Text('Task'),
      ),
      const EmployeeCheckin()
    ];
    return Row(
      children: [
        /// Pretty similar to the BottomNavigationBar!
        Observer(
          builder: (_) {
            return SideNavigationBar(
              theme: SideNavigationBarTheme(
                backgroundColor: Colors.indigo[900],
                showFooterDivider: true,
                itemTheme: const ItemTheme(
                  selectedItemColor: Colors.yellow,
                  unselectedItemColor: Colors.white,
                ),
                showHeaderDivider: true,
                showMainDivider: true,
                togglerTheme: const TogglerTheme(),
              ),
              header: SideNavigationBarHeader(
                title: const Text(
                  "Company Name",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                image: Image.asset(
                  "assets/png/agile.png",
                  height: 70,
                  width: 50,
                ),
                subtitle: const Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              selectedIndex: store.index,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.dashboard,
                  label: 'Task',
                ),
                SideNavigationBarItem(
                  icon: Icons.personal_injury_outlined,
                  label: 'Apply Leave',
                ),
                SideNavigationBarItem(
                  icon: Icons.calendar_today,
                  label: 'Check In',
                ),
              ],
              onTap: (index) {
                store.index = index;
              },
            );
          },
        ),

        /// Make it take the rest of the available width
        Observer(
          builder: (_) {
            return Expanded(
              child: views.elementAt(store.index),
            );
          },
        )
      ],
    );
  }
}
