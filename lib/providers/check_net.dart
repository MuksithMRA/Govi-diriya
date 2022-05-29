import 'dart:io';
import 'package:flutter/cupertino.dart';

class CheckNet with ChangeNotifier {
  bool _isConnected = false;

  Future<void> checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.google.com');
      if (response.isNotEmpty) {
        _isConnected = true;
        notifyListeners();
      }
    } on SocketException catch (err) {
      _isConnected = false;
      notifyListeners();

      debugPrint(err.toString());
    }

    notifyListeners();
  }
}
