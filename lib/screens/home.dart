import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:satyam_assignment/screens/welcome.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isSmiling = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 3000),
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              shape: BoxShape.circle,
            ),
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.sentiment_very_satisfied,
                color: _isSmiling ? Colors.green[700] : Colors.grey[700],
                size: 60.0,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _auth.signOut();
            Get.offAll(Welcome());
            // setState(() {
            //   _isSmiling = !_isSmiling;
            // });
          },
          child: Icon(Icons.face),
        ),
      ),
    );
  }
}
