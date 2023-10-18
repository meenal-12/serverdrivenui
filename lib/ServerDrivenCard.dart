import 'package:flutter/material.dart';
import 'package:cardserverdriven/Cards.dart';
import 'package:cardserverdriven/CounterProvider.dart';
import 'package:get/get.dart';

class ServerDrivenCard extends StatelessWidget {
  final CardData data;
  final CounterController counterController = Get.put(CounterController());

  ServerDrivenCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          Color(int.parse(data.style.backgroundColor.replaceAll("#", "0xFF"))),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              data.title,
              style: TextStyle(
                color: Color(
                    int.parse(data.style.textColor.replaceAll("#", "0xFF"))),
                fontSize: data.style.fontSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              data.description,
              style: TextStyle(
                color: Color(
                    int.parse(data.style.textColor.replaceAll("#", "0xFF"))),
                fontSize: data.style.fontSize,
              ),
            ),
          ),
          Obx(() => Text(
              'Count: ${counterController.count}')), // Display the counter value on each card
        ],
      ),
    );
  }
}
