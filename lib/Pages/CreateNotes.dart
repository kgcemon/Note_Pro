import 'package:flutter/material.dart';
import 'package:notepro/data_services/alldata_service.dart';
import 'package:notepro/provider/home_page_provider.dart';
import 'package:notepro/widget/CreateNotesWidget.dart';
import 'package:provider/provider.dart';

class CreateNotes extends StatelessWidget {
  bool enable;

   CreateNotes({super.key,required this.enable});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CreateAppbar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: MyCreateNotes(enable: enable),
      ),
    );
  }
}

class CreateAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CreateAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        actions: [
          InkWell(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff3B3B3B)),
              child: const Icon(Icons.remove_red_eye,
                  size: 35, color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff3B3B3B)),
            child: InkWell(
              onTap: () {
                Provider.of<HomePageProvider>(context, listen: false).addNotes(context);
                Provider.of<HomePageProvider>(context, listen: false).addData();
              },
                child: const Icon(Icons.save, size: 35, color: Colors.white)),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
        backgroundColor: Colors.black);
  }
}
