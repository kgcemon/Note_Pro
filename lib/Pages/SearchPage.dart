import 'package:flutter/material.dart';
import 'package:notepro/fregment/mainlist_fregment.dart';
import 'package:notepro/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Provider.of<HomePageProvider>(context, listen: false)
            .Clearinput();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SearchBox()),
              Expanded(
                  child: Provider.of<HomePageProvider>(context)
                          .mydataList
                          .isEmpty
                      ? Column(
                          children: [
                            Image.asset("images/nosearch.png"),
                            const Text("Notes not found. Try searching again.",
                                style: TextStyle(color: Color(0xffFFFFFF))),
                          ],
                        )
                      : NotesList()),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38.0),
      child: TextField(
        controller:
            Provider.of<HomePageProvider>(context).searchInputController,
        style: const TextStyle(color: Colors.white),
        onChanged: Provider.of<HomePageProvider>(context).searchSystem,
        decoration: InputDecoration(
          focusColor: Colors.white,
          hoverColor: Colors.white,
          suffix: InkWell(
              onTap: () {
                Provider.of<HomePageProvider>(context, listen: false)
                    .Clearinput();
              },
              child: const Icon(Icons.cancel, color: Color(0xffCCCCCC))),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          hintStyle: const TextStyle(color: Color(0xffCCCCCC)),
          hintText: 'Search by the keyword...',
          filled: true,
          fillColor: const Color(0xff3B3B3B),
        ),
      ),
    );
  }
}
