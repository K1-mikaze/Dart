import 'package:flutter/material.dart';

class ScreenCounter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clicks Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [Text('0',style: TextStyle(fontSize: 150.0,
          fontWeight: FontWeight.w100),
          ),
          Text('Clicks',style: TextStyle(fontSize: 30),
          )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){


        },
        child: Icon(Icons.heart_broken),
      ),
    );
  }
}
