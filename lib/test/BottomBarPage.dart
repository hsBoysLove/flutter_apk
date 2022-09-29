import 'package:flutter/material.dart';
import 'package:flutter_project/test/CategoryPage.dart';
import 'package:flutter_project/test/DynamicPage.dart';
import 'package:flutter_project/test/MessagePage.dart';
import 'package:flutter_project/test/MinePage.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppHomePageState();
  }
}

class _AppHomePageState extends State<BottomBarPage> {
  int _index = 0;
  final List<Widget> _homeWidgets = [
    const DynamicPage(),
    const MessagePage(),
    const CategoryPage(),
    const MinePage()
  ];

  void _onBottomNagiationBarTapped(index) {
    setState(() {
      _index = index;
    });
  }

  BottomNavigationBarItem _getBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
        icon: _index == index
            ? Image.asset(
                pressedIcon,
                width: 32,
                height: 32,
                // fit: BoxFit.fill,
              )
            : Image.asset(
                normalIcon,
                width: 32,
                height: 32, /*fit: BoxFit.fill*/
              ),
        label: title);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "dsada",
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.red,
            textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                headline2: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)),
            fontFamily: "Georgia"),
        home: Scaffold(
          appBar: AppBar(
            title: Text("", style: Theme.of(context).textTheme.headline5),
            centerTitle: false,
            toolbarHeight: 0,
            backgroundColor: Colors.white,
          ),
          body: IndexedStack(
            index: _index,
            children: _homeWidgets,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _index,
            onTap: _onBottomNagiationBarTapped,
            items: [
              _getBottomNavItem(
                  "动态", 'images/h5_icon.jpg', 'images/h5_icon.jpg', 0),
              _getBottomNavItem(
                  "消息", 'images/linux_icon.jpeg', 'images/linux_icon.jpeg', 1),
              _getBottomNavItem(
                  "分类", 'images/mac_icon.jpg', 'images/mac_icon.jpg', 2),
              _getBottomNavItem(
                  "我的", 'images/win_icon.jpg', 'images/win_icon.jpg', 3)
            ],
          ),
        ));
  }
}
