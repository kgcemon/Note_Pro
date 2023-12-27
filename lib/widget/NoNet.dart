import 'package:flutter/material.dart';

import '../Pages/CreateNotes.dart';

class NoNet extends StatelessWidget {
  const NoNet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("images/nonote.png"),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  CreateNotes(enable: true,),
              ),);
          },
          child: const Text(
            "Create your first note !",
            style: TextStyle(color: Color(0xffFFFFFF)),
          ),
        )
      ],
    );
  }
}
