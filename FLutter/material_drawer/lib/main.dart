import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


void main(){
  //WidgetsApps / MaterialApp / CupertinoApp
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Awesome App'),
      ),
      body: Center(
        child: Container(
          color: Colors.teal,
          height: 100,
          width: 100,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            /*DrawerHeader(
              child: Text("Hi I am a drawner"),
              decoration: BoxDecoration(
                color: Colors.red,
              )
            ),*/
            UserAccountsDrawerHeader(
                accountName: Text('K1-mikaze'),
                accountEmail: Text('K1mikaze@proton.me'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1661761279717-11639d5be993?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Z3V5fGVufDB8fDB 8fHww')
              )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Sergio Idarraga"),
              subtitle: Text('Developer'),
              trailing: Icon(Icons.edit),
              onTap: (){},

            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("sergio.idarraga.9822@miremington.edu.co"),
              subtitle: Text('Email'),
              trailing: Icon(Icons.edit),

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.edit) ,
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}
