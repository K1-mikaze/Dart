import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    const List<String> suggestions = [
      "Workout",
      "Energize",
      "Feel good",
      "Relax",
      "Commute",
      "Romance",
      "Sad",
      "Focus",
      "Sleep",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(children: [Icon(Icons.music_video_rounded), Text("Music")]),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.border_all_sharp)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.circle_rounded)),
        ],
      ),
      body: Column(
        children: [
          suggestionsScrollButtons(suggestions),
          SizedBox(
            height: 180,
            child: Row(
              children: [
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [CustomCard(), CustomCard(), CustomCard()],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 400,
            child: Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Icon(Icons.circle_rounded),
                      SizedBox(width: 10),
                      Column(children: [Text("User_name"), Text("Speed Dial")]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: floatingButton(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => print("Bottom bar button Working"),
              child: Column(children: [Icon(Icons.home), Text("Home")]),
            ),

            InkWell(
              child: Column(
                children: [Icon(Icons.play_arrow), Text("Samples")],
              ),
              onTap: () => print("Bottom bar button Working"),
            ),
            InkWell(
              child: Column(
                children: [
                  Icon(Icons.compare_arrows_outlined),
                  Text("Explore"),
                ],
              ),
              onTap: () => print("Bottom bar button Working"),
            ),
            InkWell(
              child: Column(
                children: [Icon(Icons.music_note), Text("Library")],
              ),
              onTap: () => print("Bottom bar button Working"),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton floatingButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
      child: Icon(Icons.add),
    );
  }

  SizedBox CustomCard() {
    return SizedBox(
      width: 180,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.all(Radius.circular(4)),
          ),
          color: Colors.blue,
          child: Center(child: Text("Hello data")),
        ),
        onTap: () => print("Hello Hello"),
      ),
    );
  }
}

SizedBox suggestionsScrollButtons(List<String> suggestions) {
  return SizedBox(
    height: 100,
    child: Row(
      children: [
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List<Widget>.generate(
              suggestions.length,
              (int i) => SizedBox(
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Chip(label: Text(suggestions[i])),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
