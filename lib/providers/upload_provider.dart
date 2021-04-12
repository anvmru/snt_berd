import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ViewState{
  LOADING,
  IDLE
}
class UploadProvider with ChangeNotifier {
  ViewState _viewState = ViewState.IDLE;
  ViewState get getViewState => _viewState;

  void setToLoading() {
    _viewState = ViewState.LOADING;
    notifyListeners();
  }

  void setToIdle() {
    _viewState = ViewState.IDLE;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}