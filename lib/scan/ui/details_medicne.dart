import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key? key,
      required this.image,
      required this.dosage,
      required this.name,
      required this.plus,
      required this.nega,
      required this.instruction})
      : super(key: key);
  final String image;
  final String dosage;
  final String name;
  final String plus;
  final String nega;
  final String instruction;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedColor = Colors.blue;

  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          header(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'التاثيرات الاجابية',
                  style: TextStyle(
                      fontSize: 17, height: 1.5, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.plus,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
                Text(
                  'التاثيرات السلبية',
                  style: TextStyle(
                      fontSize: 17, height: 1.5, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.nega,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
                Text(
                  'كيف يتم تناول الدواء',
                  style: TextStyle(
                      fontSize: 17, height: 1.5, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.instruction,
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            widget.image,
            width: 100,
            height: 100,
          ),
          Text(widget.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
        ],
      ),
    );
  }
}
