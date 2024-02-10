import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {
  bool _disposed = false;

  bool _busy = false;
  bool get busy => _busy;

  String errorMessage = '';
  dynamic data;
  bool get disposed => _disposed;

  BuildContext? baseContext;

  void setBusy(bool newValue) {
    _busy = newValue;
    notifyListeners();
  }

  //NOTE: Should we set busy automaticlly to false once the error message was set
  void setErrorMessage(String newValue, {bool? setBusy}) {
    _busy = setBusy ?? _busy;
    errorMessage = newValue;
    notifyListeners();
  }

  void setData(dynamic newValue) {
    data = newValue;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  //NOTE: Calls the builder function with this updated ViewModel
  void forceRebuild() {
    notifyListeners();
  }

  void softResetStateManager({bool? disposed, bool? busy, bool? errorMessage, bool? data}) {
    if (disposed == true) {
      _disposed = false;
    }

    if (busy == true) {
      _busy = false;
    }

    if (errorMessage == true) {
      this.errorMessage = '';
    }

    if (data == true) {
      this.data = null;
    }
  }

  void softResetStateManagers() {
    _disposed = false;
    _busy = false;
    errorMessage = '';
    data = null;
  }

  void resetStateManagersWithStateUpdate() {
    _disposed = false;
    _busy = false;
    errorMessage = '';
    data = null;

    forceRebuild();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}