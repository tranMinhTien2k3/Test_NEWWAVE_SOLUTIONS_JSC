import 'package:flutter/material.dart';

import 'package:my_app/Model/Address.dart';
import 'package:my_app/Services/Api.dart';

class AddressViewModel extends ChangeNotifier {
  List<Address> _addresses = [];
  bool _isLoading = false;
  String? _error;

  List<Address> get addresses => _addresses;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAddresses(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      Api api = Api();
      _addresses = await api.fetchAddresses(query);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
