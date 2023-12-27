import 'package:flutter/material.dart';
import 'package:notepro/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class MyCreateNotes extends StatelessWidget {
  bool enable;
   MyCreateNotes({super.key, required this.enable});

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
       TextField(
         enabled: enable,
        controller:  Provider.of<HomePageProvider>(context).titleController,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintStyle: TextStyle(color: Color(0xffCCCCCC),fontSize: 25),
          hintText: 'Title',
          filled: true,
          fillColor: Colors.black,
        ),
      ),

      TextField(
        enabled: enable,
        controller: Provider.of<HomePageProvider>(context).fullTextController,
        maxLines: 30,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          hintStyle: TextStyle(color: Color(0xffCCCCCC)),
          hintText: 'Type something...',
          filled: true,
          fillColor: Colors.black,
        ),
      ),

    ]);
  }
}
