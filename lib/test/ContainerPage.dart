import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "--box model-->",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("box model"),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Container(
              color: Colors.red,
              margin: const EdgeInsets.fromLTRB(10, 10, 20, 30),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 20, 30),
                color: Colors.white60,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: const Text("做三四月的事,七八月自有答案"),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {

        }),
      ),
    );
  }
}
