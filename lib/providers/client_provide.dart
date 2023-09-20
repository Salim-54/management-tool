import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:management_tool/models/client.model.dart';

import '../utils/http_exception.dart';

class ClientsProvider with ChangeNotifier {
  final Dio http;

  List<Client> _items = [];

  ClientsProvider(this.http);
  String? _selectedClient;
 
  String _token = "";

  void update(
    String token,
    List<Client> clients,
  ) {
    _token = token;
    _items = clients;
    // http.options.headers["token"] = _token;
  }

  TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController {
    return _searchController;
  }

  String _search = "";

  String get search {
    return _search;
  }


  String? get selectedClient {
    return _selectedClient;
  }


  // on text change
  void onSearchChanged(String value) {
    if (kDebugMode) {
      print(value);
    }
    _search = value;
    notifyListeners();
  }
  void onSelectedClientChanged(String value) {
    _selectedClient = value;
    notifyListeners();
  }

  void onSelectedClientClear() {
    _selectedClient = null;
    notifyListeners();
  }

  void onSelectedClientSaved(String value) {
    _selectedClient = value;
    notifyListeners();
  }


  List<Client> get items {
    List<Client> filtered = _items
        .where((item) =>
            item.name.toLowerCase().contains(_search.toLowerCase()) ||
            item.office.toLowerCase().contains(_search.toLowerCase()) ||
            item.phone.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    return filtered;
    // return [..._items];
  }
  List<String> get droppedClients {
    var items = _items.map((e) => e.name).toList();
    return items;
  }

  List<String> get droppedOffices {
    var items = _items.map((e) => e.office).toList();
    return items;
  }

  List<String> get droppedBranches {
    var items = _items.map((e) => e.office).toList();
    return items;
  }
  Future<void> fetchAndSave() async {
    if (kDebugMode) {
      // print('at least here +++++');
      // print('🎌🎌🎌🎌🎌🎌🎌🎌');
      // print(_token);
    }
    try {
      List<Client> clients = [];
      final response = await http.get(
        "/client",
        options: Options(
          headers: {"Authorization": 'Bearer $_token'},
        ),
      );
      if (kDebugMode) {
        print(response.data["list"].length);
      }
      response.data["list"].forEach((client) {
        clients.add(Client.fromJson(client));
      });
      _items = clients;
      // if (kDebugMode) {
      //   print('+++++++++++++++++++ findAll clients');
      // }
      // if (kDebugMode) {
      //   print(clients[0].name);
      // }
      // if (kDebugMode) {
      //   print(response.data);
      // }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw CustomHttpException(e.response?.data["message"]);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Client findById(String id) {
    return _items.firstWhere((client) => client.id == id);
  }
}
