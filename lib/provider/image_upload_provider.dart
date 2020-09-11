import 'package:flutter/cupertino.dart';
import 'package:skypeflutter/enum/view_state.dart';

class ImageUpLoadProvider with ChangeNotifier {
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
}
