import 'package:flutter/cupertino.dart';

class ListProvider extends ChangeNotifier{

  List<Map<String,dynamic>> _mData = [];


  void addData(Map<String,dynamic> data){
    _mData.add(data);
    notifyListeners();
  }


  void updateData(Map<String,dynamic> updatedata, int index) {
    _mData[index] = updatedata;
    notifyListeners();
  }
  void deleteData(int index){
    _mData.removeAt(index);
    notifyListeners();

  }

  List<Map<String,dynamic>> getData() => _mData;



}

