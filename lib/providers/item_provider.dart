import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:management_tool/models/item.model.dart';

import '../utils/http_exception.dart';

class ItemsProvider with ChangeNotifier {
  final Dio http;

  // search
  TextEditingController _itemTagController = TextEditingController();
  TextEditingController _itemTagController1 = TextEditingController();
  TextEditingController _itemTagController2 = TextEditingController();
  TextEditingController _itemTagController3 = TextEditingController();
  TextEditingController _itemTagController4 = TextEditingController();
  TextEditingController _itemTagController5 = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  TextEditingController _dSearchController = TextEditingController();

  TextEditingController get itemTagController {
    return _itemTagController;
  }

  TextEditingController get itemTagController1 {
    return _itemTagController1;
  }

  TextEditingController get itemTagController2 {
    return _itemTagController2;
  }

  TextEditingController get itemTagController3 {
    return _itemTagController3;
  }

  TextEditingController get itemTagController4 {
    return _itemTagController4;
  }

  TextEditingController get itemTagController5 {
    return _itemTagController5;
  }

  TextEditingController get searchController {
    return _searchController;
  }

  TextEditingController get dSearchController {
    return _dSearchController;
  }

  String? _requestItem;

  String _tagItem = "";
  String _tagItem1 = "";
  String _tagItem2 = "";
  String _tagItem3 = "";
  String _tagItem4 = "";
  String _tagItem5 = "";
  String _search = "";
  String _dSearch = "";

  String? _selectedReturnItem;


  String? get requestItem {
    return _requestItem;
  }

  String get tagItem {
    return _tagItem;
  }

  String get tagItem1 {
    return _tagItem1;
  }

  String get tagItem2 {
    return _tagItem2;
  }

  String get tagItem3 {
    return _tagItem3;
  }

  String get tagItem4 {
    return _tagItem4;
  }

  String get tagItem5 {
    return _tagItem5;
  }

  String get search {
    return _search;
  }

  String get dSearch {
    return _dSearch;
  }

  String get selectedReturnItem {
    return _selectedReturnItem ?? "";
  }

  void setTagItem(String tagItem) {
    _tagItem = tagItem;
    // notifyListeners();
    print(_tagItem);
  }

  void setTagItem1(String tagItem) {
    _tagItem1 = tagItem;
    // notifyListeners();
    print(_tagItem1);
  }

  void setTagItem2(String tagItem) {
    _tagItem2 = tagItem;
    print(_tagItem2);
    // notifyListeners();
  }

  void setTagItem3(String tagItem) {
    _tagItem3 = tagItem;
    print(_tagItem3);
    // notifyListeners();
  }

  void setTagItem4(String tagItem) {
    _tagItem4 = tagItem;
    print(_tagItem4);
    // notifyListeners();
  }

  void setTagItem5(String tagItem) {
    _tagItem5 = tagItem;
    print(_tagItem5);
    // notifyListeners();
  }

  // on text change
  void onSearchChanged(String value) {
    _search = value;
    notifyListeners();
  }

  void onDSearchChanged(String value) {
    _dSearch = value;
    notifyListeners();
  }

  void setSearch(String search) {
    _search = search;
    notifyListeners();
  }

  void setDSearch(String search) {
    _dSearch = search;
    notifyListeners();
  }

  void onReturnItemChanged(String item) {}

// dropdown button
  void onRequestItemChanged(String value) {
    _requestItem = value;
    notifyListeners();
  }

  void onRequestItemClear() {
    _requestItem = null;
    notifyListeners();
  }

  void onRequestItemSaved(String value) {
    _requestItem = value;
    notifyListeners();
  }
//

  List<Item> _items = [];

  ItemsProvider(this.http);

  String _token = "";
  String _itemId = "";

  String _tab = "";
  final List<String> _tabs = const [
    'Available',
    'Used',
  ];

  String get tab {
    return _tab;
  }

  List<String> get tabs {
    return _tabs;
  }

  void setTab(String tab) {
    _tab = tab;
    notifyListeners();
  }

  void update(
    String token,
    List<Item> products,
  ) {
    _token = token;
    _items = products;
    // http.options.headers["token"] = _token;
  }

  List<Item> get items {
    List<Item> filteredItems = _items
        .where((item) =>
            item.name.toLowerCase().contains(_search.toLowerCase()) ||
            item.model.toLowerCase().contains(_search.toLowerCase()) ||
            item.color.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    return filteredItems;
  }

  List<String> get droppedItems {
    var items = _items.map((e) => e.name).toList();
    return items;
  }

  String get itemId {
    return _itemId;
  }

  void setItemId(String id) {
    _itemId = id;

    if (kDebugMode) {
      print(id);
    }
    notifyListeners();
  }

// list of reasons

  Future<void> fetchAndSave() async {
    if (kDebugMode) {
      // print('at least here +++++');
      // print('🎌🎌🎌🎌🎌🎌🎌🎌');
      // print(_token);
    }
    try {
      List<Item> products = [];
      final response = await http.get(
        "/product",
        options: Options(
          headers: {"Authorization": 'Bearer $_token'},
        ),
      );
      if (kDebugMode) {
        print(response.data["list"].length);
      }
      response.data["list"].forEach((product) {
        products.add(Item.fromJson(product));
      });
      _items = products;
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

  Item findById(String id) {
    return _items.firstWhere((client) => client.id == id);
  }
}
