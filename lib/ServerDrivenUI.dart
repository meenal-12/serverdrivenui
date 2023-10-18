// import 'dart:js_util';

import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:cardserverdriven/Cards.dart';
import 'package:cardserverdriven/ServerDrivenCard.dart';
import 'package:cardserverdriven/Button.dart';
import 'package:cardserverdriven/CounterProvider.dart';
import 'package:get/get.dart';
import 'package:cardserverdriven/buttonStyle.dart';
import 'package:cardserverdriven/Button.dart';

class ServerDrivenUI extends StatefulWidget {
  @override
  _ServerDrivenUIState createState() => _ServerDrivenUIState();
}

class _ServerDrivenUIState extends State<ServerDrivenUI> {
  List<CardData> cardData = [];

  final CounterController counterController = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final jsonString = await rootBundle.loadString('assets/json/sample.json');
    final jsonData = json.decode(jsonString);

    final List<dynamic> cardList = jsonData['cards'];
    cardData = cardList.map((data) => CardData.fromJson(data)).toList();

    final List<dynamic> buttonData = jsonData['button'];
    btnData = buttonData[0];
    print(buttonData[0]);

    print(ButtonData);
    setState(() {});
  }

  // void incrementCounter() {
  //   setState(() {
  //     counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Driven UI'),
      ),
      body: Column(
        children: [
          //to make this server driven
          // ElevatedButton(
          //   onPressed: incrementCounter,
          //   child: const Text('Increment Counter'),
          // ),
          ElevatedButton(
            onPressed: () => counterController.increment(),
            child: Text(btnData.text),
          ),
          Obx(() => Text('Count: ${counterController.count}')),
          Expanded(
            child: ListView.builder(
              itemCount: cardData.length,
              itemBuilder: (context, index) {
                return ServerDrivenCard(data: cardData[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
