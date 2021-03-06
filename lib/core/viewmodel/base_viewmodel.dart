import 'package:bljr_mvvm/core/enums/viewstate.dart';
import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier{
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState){
    _state = viewState;
    notifyListeners();
  }
}