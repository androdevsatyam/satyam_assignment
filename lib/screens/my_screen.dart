import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyScreen extends StatefulWidget {
  MyScreen({Key? key}) : super(key: key);



  @override
  State<MyScreen> createState() => _MyScreenState();
}

List<CountryName> countries= <CountryName>[
  CountryName("INDIA", "in"),
  CountryName("USA", "usa"),
  CountryName("UAE", "uae")
];

class _MyScreenState extends State<MyScreen> {
  CountryName choosed = countries.elementAt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButton<CountryName>(
          value: choosed,
          items: countries.map((CountryName value) {
            return DropdownMenuItem<CountryName>(
              value: value,
              child: Row(
                children: [getIcon(value.icon), Text(value.name)],
              ),
            );
          }).toList(),
          onChanged: (CountryName? newvalue) {
            setState(() {
              choosed=newvalue!;
            });
          },
        ),
      ),
    );
  }

  getIcon(String icon) {
    return icon == "in"
        ? Icon(
            Icons.emoji_flags,
            color: Colors.orange,
          )
        : icon == "usa"
            ? Icon(
                Icons.emoji_flags,
                color: Colors.deepPurpleAccent,
              )
            : icon == "uae"
                ? Icon(
                    Icons.emoji_flags,
                    color: Colors.blue,
                  )
                : Icon(
                    Icons.emoji_flags,
                  );
  }
}

class CountryName {
  String name = "";
  String icon = "";

  CountryName(this.name, this.icon);
}