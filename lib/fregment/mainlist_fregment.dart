import 'package:flutter/material.dart';
import 'package:notepro/Pages/CreateNotes.dart';
import 'package:provider/provider.dart';

import '../provider/home_page_provider.dart';

class NotesList extends StatelessWidget {
  NotesList({super.key});

  Color colorChange(int index) {
    List<Color> colors = [
      const Color(0xffFD99FF),
      const Color(0XffFF9E9E),
      const Color(0xff91F48F),
      const Color(0xffFFF599),
      const Color(0xff9EFFFF),
      const Color(0xffB69CFF),
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    var Notes = Provider.of<HomePageProvider>(context).mydataList;
    return ListView.builder(
      itemCount: Notes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Card(
              color: colorChange(index),
              child: ListTile(
                  onTap: () {
                    var data = Provider.of<HomePageProvider>(context,
                        listen: false);
                    data.titleController.text = Notes[index]['title'];
                    data.fullTextController.text = Notes[index]['content'];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateNotes(
                            enable: false,
                          ),
                        ));
                  },
                  trailing: InkWell(
                      onTap: () {
                        var data = Provider.of<HomePageProvider>(context,
                            listen: false);
                        data.mydataList.removeAt(index);
                        data.addData();
                        data.loadData();
                      },
                      child: const Icon(Icons.delete, color: Colors.red)),
                  title: Text("${Notes[index]['title']}", maxLines: 3),
                  subtitle: Text(
                    "${Notes[index]['content']}",
                    maxLines: 2,
                  )),
            ),
          ),
        );
      },
    );
  }
}
