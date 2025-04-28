import 'package:flutter/material.dart';
import 'package:test/view/screen/FocusedSearchScreenState.dart';
import '../../model/models.dart';

class NotePadViewBuilder extends StatelessWidget {
  const NotePadViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var notes = Notelist().GetListNotes();
    var button1 = true;
    var button2 = false;
    var buttoncolor2 = Color.fromRGBO(98, 99, 99, 1.0);
    var buttoncolor1 = Color.fromRGBO(93, 124, 144, 1.0);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0, bottom: 40.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: () {},
                      icon: Icon(Icons.rectangle_outlined),
                    ),
                    IconButton(
                      alignment: Alignment.centerLeft,
                      onPressed: () {},
                      icon: Icon(Icons.settings_outlined),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],

        leadingWidth: 100.0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 50.0),
          child: Column(
            children: [

              Row(
                children: [
                  Text("All", style: TextStyle(fontSize: 32)),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    onSelected: (value) {
                      print('print from Pop Up Menu Button, opcion ${value}');
                    },
                    itemBuilder:
                        (context) => [
                          const PopupMenuItem(
                            child: Text('Edit'),
                            value: 'Edit',
                          ),
                          const PopupMenuItem(
                            child: Text('Remove'),
                            value: 'Remove',
                          ),
                        ],
                  ),
                ],
              ),
             // FocusedSearchScreen()
            ],
          ),
        ),
      ),
      //bottomNavigationBar: ,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, i) {
            final note = notes[i];
            return Card(
              elevation: 8,
              color: Color.fromRGBO(26, 26, 26, 1.0),
              child: ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${note.dateTime.month}/${note.dateTime.day} ",
                        maxLines: 1,
                        style: TextStyle(
                          color: Color.fromRGBO(98, 99, 99, 1.0),
                        ),
                      ),
                      Icon(
                        Icons.folder_outlined,
                        color: Color.fromRGBO(98, 99, 99, 1.0),
                        size: 18.0,
                      ),
                      Text(
                        " Notes",
                        maxLines: 1,
                        style: TextStyle(
                          color: Color.fromRGBO(98, 99, 99, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomSheet: BottomAppBar(
        elevation: 8,
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!button1) {
                          button2 = false;
                          button1 = true;
                          buttoncolor1 = Color.fromRGBO(93, 124, 144, 1.0);
                          buttoncolor2 = Color.fromRGBO(98, 99, 99, 1.0);
                        }
                      },
                      icon: Icon(Icons.notes_outlined),
                      color: buttoncolor1,
                    ),
                    const Text(
                      "Notes",
                      maxLines: 1,
                      style: TextStyle(color: Color.fromRGBO(98, 99, 99, 1.0)),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!button2) {
                          button2 = true;
                          button1 = false;
                          buttoncolor2 = Color.fromRGBO(93, 124, 144, 1.0);
                          buttoncolor1 = Color.fromRGBO(98, 99, 99, 1.0);
                        }
                      },
                      icon: Icon(Icons.check_circle),
                      color: buttoncolor2,
                    ),
                    const Text(
                      "To-do",
                      maxLines: 1,
                      style: TextStyle(color: Color.fromRGBO(98, 99, 99, 1.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
