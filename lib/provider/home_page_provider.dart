import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:notepro/data_services/alldata_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageProvider extends ChangeNotifier {

  HomePageProvider(){
    loadData();
  }

  TextEditingController searchInputController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController fullTextController = TextEditingController();

  List mydataList = DataServices.Notes;

   addData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('list', jsonEncode(mydataList));
  }

  searchSystem(String data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mydataList = jsonDecode(prefs.get("list").toString()).where((element) =>
    element['title'].toLowerCase().contains(data.toLowerCase()) ||
        element['content'].toLowerCase().contains(data.toLowerCase())).toList();
    notifyListeners();
  }

  loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedData = prefs.getString('list');

    if (storedData != null) {
      mydataList = jsonDecode(storedData);
      print(storedData);
      notifyListeners();
    } else {
      mydataList = DataServices.Notes;
    }
    print(mydataList);
    notifyListeners();
  }




  Clearinput() {
    loadData();
    searchInputController.text = '';
    notifyListeners();
  }

  void addNotes(BuildContext context) {
    mydataList.add(
        {"title": titleController.text, "content": fullTextController.text});
    titleController.text = '';
    fullTextController.text = '';
    Navigator.pop(context);
    notifyListeners();
  }
  
  
}
