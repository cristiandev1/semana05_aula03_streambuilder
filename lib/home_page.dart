// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stream_builder/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = HomeController();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      _homeController.getValueCurrency();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Build HomePage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Value Currency Example'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Currency Value: '),
            SizedBox(height: 10),
            StreamBuilder<double>(
              stream: _homeController.currencyValue.stream,
              builder: (context, snapshot) {
                print('Build StreamBuilder');
                if (snapshot.hasData) {
                  return Text('\$ ${snapshot.data}');
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
