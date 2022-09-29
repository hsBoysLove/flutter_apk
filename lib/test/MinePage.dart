import 'package:flutter/material.dart';
import 'package:flutter_project/test/utils/MinePageMockData.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MinePageState();
  }
}

class _MinePageState extends State<MinePage> {
  double MARGIN = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _headerGridButtons(),
          _dynamicGridButtons(MinePageMockData.finanGrids(), "金融理财"),
          _dynamicGridButtons(MinePageMockData.finanGrids(), "生活服务"),
          _dynamicGridButtons(MinePageMockData.finanGrids(), "购物消费"),
        ],
      ),
    );
  }

  /// 添加头部视图
  Widget _headerGridButtons() {
    double H = 144;
    List<Map<String, String>> buttons = MinePageMockData.headerGrids();
    return Container(
      height: H,
      margin: EdgeInsets.fromLTRB(MARGIN, MARGIN * 4, MARGIN, MARGIN / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF56AF6D),
              Color(0xFF56AA6D),
            ]),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons
              .map((item) =>
                  _getMenus(item["icon"], item["name"], color: Colors.white))
              .toList(),
        ),
      ),
    );
  }

  GestureDetector _getMenus(String? icon, String? name,
      {Color color = Colors.black}) {
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     SizedBox(
    //       width: 50,
    //       height: 50,
    //       child: Image.asset(icon!),
    //     ),
    //     const SizedBox(height: 5),
    //     Text(
    //       name!,
    //       style: TextStyle(fontSize: 14.0, color: color, height: 2),
    //     ),
    //   ],
    // )
    return GestureDetector(
        onTap: () {
          Fluttertoast.showToast(
              msg: "--------$name----------->",
              gravity: ToastGravity.CENTER,
              webPosition: "center");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(
              name!,
              style: TextStyle(fontSize: 14.0, color: color, height: 2),
            ),
          ],
        ));
  }

  ///添加Grid视图
  Widget _dynamicGridButtons(List<Map<String, String>> buttons, String title,
      {int crossAxisCount = 4}) {
    return Container(
      margin: EdgeInsets.fromLTRB(MARGIN, MARGIN, MARGIN, MARGIN / 2),
      padding: EdgeInsets.all(MARGIN),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey[700]),
          ),
          const SizedBox(
            height: 20,
          ),
          _gridButtons(buttons, crossAxisCount, textColor: Colors.black),
        ],
      ),
    );
  }

  GridView _gridButtons(List<Map<String, String>> buttons, int crossAxisCount,
      {Color textColor = Colors.white}) {
    double gridSpace = 5.0;
    return GridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: gridSpace,
      crossAxisSpacing: gridSpace,
      //设置以下两个参数，禁止GridView的滚动，防止与 ListView 冲突
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: buttons.map((item) {
        return _getMenus(item["icon"], item["name"], color: textColor);
      }).toList(),
    );
  }
}
