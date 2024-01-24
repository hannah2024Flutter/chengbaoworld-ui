import 'package:castleworld/pages/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Container(
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Text('JUMP TO SEARCH'),
              color: Colors.blue,
              textColor: Colors.white,
              height: 50,
              minWidth: 100,
            ),
          ),
        ),
      ),
    );
  }
}
