import 'package:flutter/material.dart';
import 'package:notepro/Pages/CreateNotes.dart';
import 'package:notepro/provider/home_page_provider.dart';
import 'package:notepro/widget/NoNet.dart';
import 'package:notepro/widget/flotingbotton.dart';
import 'package:provider/provider.dart';

import '../fregment/mainlist_fregment.dart';
import '../widget/MyAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const flotingBotton(),
      backgroundColor: Colors.black,
      appBar: const MyappBar(),
      body: Provider.of<HomePageProvider>(context).mydataList.isEmpty
          ? const NoNet()
          : NotesList(),
    );
  }
}
