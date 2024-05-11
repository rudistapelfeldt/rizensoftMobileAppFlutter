import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:rizensoft_mobile_app_flutter/helpers/app_constants.dart';

class SecureStorageHelper extends PropertyChangeNotifier<String> {
  // Create storage
  final storage = new FlutterSecureStorage(); 

  Future? _init;

  Future get initializationDone => _init!;

  List<_SecItem> _items = [];

  List<_SecItem> get items => _items;

  SecureStorageHelper() {
    _init = _readAll();
  }

  set items(List<_SecItem> value) {
    _items = value;
    notifyListeners('items');
  }

  void main() async {
    await initializationDone;
  }

  IOSOptions _getIOSOptions() => IOSOptions(
        accountName: _getAccountName(),
      );

  String _getAccountName(){
    return AppConstants.ACCOUNT_NAME;
  }

  Future _readAll() async {
    final all = await storage.readAll(
        iOptions: _getIOSOptions(),
        aOptions: storage.aOptions,
      );
    
  items = all.entries
          .map((entry) => _SecItem(entry.key, entry.value))
          .toList(growable: false);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll(
      iOptions: _getIOSOptions(),
      aOptions: storage.aOptions,
    );
    _readAll();
  }

  Future<void> addNewItem(String key, String value) async {
    
    await storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: storage.aOptions,
    );
    _readAll();
  }
}

class _SecItem {
  _SecItem(this.key, this.value);

  final String key;
  final String value;
}