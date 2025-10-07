import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(10, 20),
          child: SizedBox(height: 20),
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () => print("Search"),
            icon: Icon(Icons.search_outlined),
          ),
          IconButton(
            onPressed: () => print("Settings"),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, i) => SizedBox(width: 5),
                itemCount: 10,
                itemBuilder: (context, i) => file(i.toString(), Colors.red),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
              ),
            ),

            SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, i) => SizedBox(width: 5),
                itemCount: 10,
                itemBuilder: (context, i) => file(i.toString(), Colors.red),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, i) => SizedBox(width: 5),
                itemCount: 10,
                itemBuilder: (context, i) => file(i.toString(), Colors.red),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                separatorBuilder: (context, i) => SizedBox(width: 5),
                itemCount: 10,
                itemBuilder: (context, i) => file(i.toString(), Colors.red),
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InkWell file(String data, Color color) {
  return InkWell(
    onTap: () => print("Queloque"),
    child: SizedBox(
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
        ),
        child: Text(data),
      ),
    ),
  );
}
