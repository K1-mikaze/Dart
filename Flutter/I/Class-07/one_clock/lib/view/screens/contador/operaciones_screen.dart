import 'package:flutter/material.dart';

import '../../CustomsWidgets/customButton.dart';


class OperacionesScreen extends StatefulWidget {
  const OperacionesScreen({super.key});

  @override
  State<OperacionesScreen> createState() => _OperacionesScreenState();
}

class _OperacionesScreenState extends State<OperacionesScreen> {
  int cont = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Operaciones de clicks'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              cont = 0;});},
        icon: const Icon(Icons.replay)),IconButton(onPressed: (){
          setState(() {
            cont = 0;
          });
          },icon: const Icon(Icons.replay)),],
        leading: IconButton(onPressed: (){
          setState(() {
            cont = 0;
          });
        },
            icon: const Icon(Icons.replay)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$cont',
              style: TextStyle(fontSize: 150, fontWeight: FontWeight.w100),
            ),
            Text(
              cont != 1 ? 'Clicks' : 'Click' ,
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          CustomFloatingActionButton(icon: Icons.exposure_plus_1,onPressed: PlusOperation,),
          SizedBox(width: 20),
          CustomFloatingActionButton(icon: Icons.replay,onPressed: ResetOperation,),
          SizedBox(width: 20),
          CustomFloatingActionButton(icon: Icons.exposure_minus_1, onPressed: MinusOperation,)
        ]
      ),
    );
  }

  void PlusOperation(){
    setState(() {
      cont++;
    });
  }

  void MinusOperation(){
    setState(() {
      if(cont > 0 ){cont--;};
    });
  }

  void ResetOperation(){
    setState(() {
      cont = 0;
    });
  }

} //fin de la clase


