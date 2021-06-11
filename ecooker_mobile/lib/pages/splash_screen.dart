import 'package:ecooker/shares/common.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/logo/LaunchIconCooker.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  spinKitCircleLoading(whiteColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
