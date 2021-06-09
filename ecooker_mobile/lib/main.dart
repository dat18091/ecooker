import 'package:ecooker/pages/SuperHero.dart';
import 'package:ecooker/shares/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Oxygen',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('Trang chủ'),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: TextStyle(
                  fontSize: textSize14,
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(seconds: 1),
                      transitionsBuilder:
                          (context, animation, animationTime, child) {
                        animation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.fastOutSlowIn,
                        );
                        return ScaleTransition(
                          scale: animation,
                          child: child,
//                          alignment: Alignment.center,
                        );
                      },
                      pageBuilder: (context, animation, animationTime) {
                        return HeroScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  width: _width / 3,
                  height: _height / 16,
                  decoration: BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'Click me!',
                      style: TextStyle(
                        fontSize: textSize16,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
