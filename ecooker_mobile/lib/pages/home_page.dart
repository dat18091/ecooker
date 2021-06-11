import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecooker/pages/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:ecooker/pages/SuperHero.dart';
import 'package:ecooker/pages/notification_screen.dart';
import 'package:ecooker/shares/common.dart';
import 'package:flutter/material.dart';

import 'my_image_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPos = 0;
  final List<String> listPaths = [
    'https://i.pinimg.com/originals/63/ef/b8/63efb80ff8fb97f538988112964623c0.png',
    'https://driver.gianhangvn.com/image/banner-30-04-01-05-lasted-1-1173776j1442.jpg',
    'https://cdn.tgdd.vn/Files/2019/08/12/1186922/tgdd-khai-truong-them-5-shop-laptop-online-may-ngon-uu-dai-khung-5.png',
    'https://cdn.tgdd.vn/Files/2019/01/28/1146983/thang-2-2019-mua-laptop-tai-dien-may-xanh-nhan-uu-dai-soc-pmh.jpg',
    'https://cdn.tgdd.vn/Files/2019/12/27/1228779/tet_800x450.jpg',
    'https://cdn.tgdd.vn/Files/2019/06/14/1173155/laptop_800x450.jpg',
    'https://cdn.tgdd.vn/Files/2014/11/07/579122/mua-laptop-nhan-ngay-qua-tang.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    // APPBAR DESIGN INCLUDE TEXT SEARCH
    Widget _textSearchAppBar() {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
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
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return SearchScreen();
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          width: _width / 1.3,
          height: _height / 20,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tìm kiếm ở đây',
                style: TextStyle(color: textColor),
              ),
              Icon(
                Icons.search,
                size: 25,
                color: textColor,
              ),
            ],
          ),
        ),
      );
    }
    // END APPBAR DESIGN INCLUDE TEXT SEARCH

    // APPBAR DESIGN INCLUDE NOTIFICATION
    Widget _notificationAppBar() {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
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
                );
              },
              pageBuilder: (context, animation, animationTime) {
                return NotificationScreen();
              },
            ),
          );
        },
        child: Container(
          width: _width / 8,
          height: _height / 18,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 6),
                child: Container(
                  child: Icon(
                    Icons.notifications,
                    color: whiteColor,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 25.0, bottom: 5.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 17,
                      height: 17,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      );
    }
    // END APPBAR DESIGN INCLUDE NOTIFICATION

    // WIDGET BUILD CAROUSEL SLIDER
    Widget _buildCarouselSlider() {
      return Stack(
        children: [
          Container(
            width: _width,
            height: _height / 4,
            child: CarouselSlider.builder(
              itemCount: listPaths.length,
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  }),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(listPaths[index],
                          fit: BoxFit.cover, width: _width)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
              width: _width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listPaths.map((url) {
                  int index = listPaths.indexOf(url);
                  return Container(
                    width: currentPos == index ? 7.0 : 7.0,
                    height: currentPos == index ? 7.0 : 1.5,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                      shape: currentPos == index ? BoxShape.circle : BoxShape.rectangle,

                      color: currentPos == index
                          ? primaryColor
                          : whiteColor,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
    }
    // END WIDGET BUILD CAROUSEL SLIDER

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          toolbarHeight: _height / 13, // Set this height
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: _height / 13,
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _textSearchAppBar(),
                _notificationAppBar(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildCarouselSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
