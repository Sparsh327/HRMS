import 'package:flutter/material.dart';
import '../../features/auth/ui/owner_login_page.dart';
import '../../features/auth/ui/register.dart';

import '../utils/responsive_layout.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final navLinks = ["Home", "Products", "Features", "Contact"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: const EdgeInsets.only(left: 18),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Montserrat-Bold",
            color: Colors.white,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> actionPopUpItemSelected(
      BuildContext context,
      int selected,
    ) async {
      // await gossipStore.onRefresh();
      if (selected == 0) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const OwnerLoginPage()),
        );
      } else if (selected == 1) {
        // await gossipStore.onRefresh();
      }
      // await gossipStore.onRefresh();
    }

    return Container(
      color: Colors.indigo[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      image: AssetImage("assets/png/agile.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text(
                  "HRMS",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ],
            ),
            if (!ResponsiveLayout.isSmallScreen(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ...navItem(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 18),
                      decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                letterSpacing: 1,
                                fontFamily: "Montserrat-Bold",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PopupMenuButton(
                    padding: EdgeInsets.zero,
                    // ignore: avoid_types_on_closure_parameters
                    onSelected: (int value) =>
                        actionPopUpItemSelected(context, value),
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.manage_accounts,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('HR Login'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Employee Login'),
                            ],
                          ),
                        )
                      ];
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 18),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 8,
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Login",
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
                    ),
                  ),
                ],
              )
            else
              IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
          ],
        ),
      ),
    );
  }
}
