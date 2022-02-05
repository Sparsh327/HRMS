import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:side_navigation/side_navigation.dart';

import '../../auth/store/login_store.dart';
import '../store/dashboard_store.dart';
import 'widgets/add_employee_page.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DashBoardStore(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
          backgroundColor: Colors.indigo[900],
        ),
        body: const DashBoardNavBar(),
      ),
    );
  }
}

class DashBoardNavBar extends StatelessWidget {
  const DashBoardNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);
    final dashboardStore = Provider.of<DashBoardStore>(context);

    final List<Widget> views = [
      Center(
        child: Column(
          children: [
            const Text('Dashboard'),
            TextButton(
              onPressed: () {
                loginStore.signOut(context);
                // FirebaseFirestore.instance.collection("Leave").doc().set({"name":"cc",});
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
      const AddEmployeePage(),
      const Center(
        child: Text('Add Employee'),
      ),
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
              selectedIndex: dashboardStore.index,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                ),
                SideNavigationBarItem(
                  icon: Icons.person,
                  label: 'Add Employee',
                ),
                SideNavigationBarItem(
                  icon: Icons.settings,
                  label: 'Settings',
                ),
              ],
              onTap: (index) {
                dashboardStore.index = index;
              },
            );
          },
        ),

        /// Make it take the rest of the available width
        Observer(
          builder: (_) {
            return Expanded(
              child: views.elementAt(dashboardStore.index),
            );
          },
        )
      ],
    );
  }
}
