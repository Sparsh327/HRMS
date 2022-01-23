import 'package:flutter/material.dart';

import '../../core/utils/responsive_layout.dart';
import '../../core/widgets/navbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[NavBar(), const Body()],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: const LargeChild(),
      smallScreen: const SmallChild(),
      mediumScreen: Container(),
    );
  }
}

class LargeChild extends StatelessWidget {
  const LargeChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            alignment: Alignment.centerRight,
            widthFactor: .6,
            child: Image.network("assets/png/L1.jpg", scale: .85),
          ),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Hello!",
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat-Regular",
                      color: Color(0xFF8591B0),
                    ),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: "WellCome To ",
                      style: TextStyle(fontSize: 60, color: Color(0xFF8591B0)),
                      children: [
                        TextSpan(
                          text: "HRMS",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12, top: 20),
                    child: Text("LET’S EXPLORE THE WORLD"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // Search()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SmallChild extends StatelessWidget {
  const SmallChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Hello!",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xFF8591B0),
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat-Regular",
              ),
            ),
            RichText(
              text: const TextSpan(
                text: 'WellCome To ',
                style: TextStyle(fontSize: 40, color: Color(0xFF8591B0)),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Britu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 20),
              child: Text("LET’S EXPLORE THE WORLD"),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                "assets/png/L1.jpg",
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            // Search(),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
