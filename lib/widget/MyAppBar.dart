import 'package:flutter/material.dart';
import 'package:notepro/Pages/SearchPage.dart';

class MyappBar extends StatelessWidget implements PreferredSizeWidget {
  const MyappBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                )),
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff3B3B3B)),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xff3B3B3B)),
            child: const Icon(Icons.info, color: Colors.white),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
        title: const Text(
          "Notes",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.black);
  }
}
