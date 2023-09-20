import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:management_tool/models/request.model.dart';

import '../utils/http_exception.dart';

class RequestProvider with ChangeNotifier {
  final Dio http;

  // search

  TextEditingController _searchController = TextEditingController();
  TextEditingController _itemCategoryController = TextEditingController();
  TextEditingController _itemController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();

  TextEditingController _requestTag = TextEditingController();

  TextEditingController get requestTag {
    return _requestTag;
  }

  TextEditingController get searchController {
    return _searchController;
  }

  TextEditingController get itemCategoryController {
    return _itemCategoryController;
  }

  TextEditingController get itemController {
    return _itemController;
  }

  TextEditingController get quantityController {
    return _quantityController;
  }

  TextEditingController get reasonController {
    return _reasonController;
  }

  String _itemCategory = "";
  String _item = "";
  String _quantity = "";
  String _reason = "";
  String _search = "";
  String _tagRequest = "";
  String? _returnItem;

  String get itemCategory {
    return _itemCategory;
  }

  String get item {
    return _item;
  }

  String get quantity {
    return _quantity;
  }

  String get reason {
    return _reason;
  }

  String get search {
    return _search;
  }


  String get tagRequest {
    return _tagRequest;
  }

  String? get returnItem {
    return _returnItem;
  }

  void onTagChanged(String value) {
    _tagRequest = value;
  }

  void onItemCategoryChanged(String value) {
    _itemCategory = value;
    notifyListeners();
  }

  void onItemChanged(String value) {
    _item = value;
    notifyListeners();
  }

  void onQuantityChanged(String value) {
    _quantity = value;
    notifyListeners();
  }

  void onReasonChanged(String value) {
    _reason = value;
    notifyListeners();
  }

  void onSearchChanged(String value) {
    _search = value;
    notifyListeners();
  }

  void onReturnItemChanged(String value) {
    _returnItem = value;
    notifyListeners();
  }

  void onReturnClear() {
    _returnItem = null;
    notifyListeners();
  }

  void onReturnItemSaved(String value) {
    _returnItem = value;
    notifyListeners();
  }

  List<Request> _items = [];

  RequestProvider(this.http);

  String _token = "";

  void update(
    String token,
    List<Request> requests,
  ) {
    _token = token;
    _items = requests;
    // http.options.headers["token"] = _token;
  }

  final List<String> _tabs = const ['Pending', 'Accepted', 'Declined'];
  String _selectedTab = '';

  String get selectedTab {
    return _selectedTab;
  }

  List<String> get tabs {
    return _tabs;
  }

  void selectTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }

  List<Request> get items {
    List<Request> filteredRequests = _items
        .where((item) =>
            item.name.toLowerCase().contains(_search.toLowerCase()) ||
            item.date.toLowerCase().contains(_search.toLowerCase()) ||
            item.reason.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    return filteredRequests;
  }



  List<String> get reasons {
    var reasons = _items.map((e) => e.reason).toList();
    return reasons;
  }

  Future<void> fetchAndSave() async {
    try {
      List<Request> requests = [];
      final response = await http.get(
        "/request",
        options: Options(
          headers: {"Authorization": 'Bearer $_token'},
        ),
      );

      response.data["List"].forEach((request) {
        requests.add(Request.fromJson(request));
      });
      _items = requests;
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

  Request findById(String id) {
    return _items.firstWhere((request) => request.id == id);
  }
}
