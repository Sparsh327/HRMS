import 'package:flutter/material.dart';

import '../../features/dashboard/ui/dashboard.dart';
import '../utils/responsive_layout.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  final navLinks = ["Home", "Products", "Features", "Contact"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: const EdgeInsets.only(left: 18),
        child:
            Text(text, style: const TextStyle(fontFamily: "Montserrat-Bold")),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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
                          builder: (_) => const DashBoardScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF6078ea).withOpacity(.3),
                            offset: const Offset(0, 8),
                            blurRadius: 8,
                          )
                        ],
                      ),
                      child: const Material(
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontFamily: "Montserrat-Bold",
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
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
