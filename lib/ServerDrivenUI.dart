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
  ButtonData btnData = ButtonData.empty(); // Initialize with an empty instance

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
    if (buttonData.isNotEmpty) {
      btnData = ButtonData.fromJson(buttonData[0]); // Populate btnData
      print(btnData.text);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(btnData.style.backgroundColor);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Server Driven UI'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => counterController.increment(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(int.parse(
                  btnData.style.backgroundColor.replaceAll("#", "0xFF"))),
              // Background color
              // Text color
              elevation: 5, // Shadow
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
            ),
            child: Text(
              btnData.text,
              style: TextStyle(fontSize: btnData.style.fontSize),
            ),
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
