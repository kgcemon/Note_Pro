import 'package:flutter/material.dart';
import 'package:notepro/Pages/CreateNotes.dart';
import 'package:notepro/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class flotingBotton extends StatelessWidget {
  const flotingBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 20,
      backgroundColor: Colors.white,
      child: const Icon(Icons.add, color: Colors.black, size: 45),
      onPressed: () {
        var data = Provider.of<HomePageProvider>(context, listen: false);
        data.fullTextController.text = '';
        data.titleController.text = '';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNotes(enable: true,),
            ));
      },
    );
  }
}
