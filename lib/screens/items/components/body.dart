import 'package:flutter/material.dart';
import 'package:management_tool/screens/items/components/assign2.dart';

import 'assign1.dart';
import 'body1.dart';
import 'body2.dart';
import 'detail.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<int> _processes = [
    1,
    2,
    3,
  ];
  int _process = 1;
  int _assign = 0;

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return _process == 2
        ? Details(
            goItems: () {
              setState(() {
                _process = 1;
                _selected = false;
              });
            },
            goLeasing: () {
              setState(() {
                _process = 3;
                _assign = 2;
              });
            },
            goSale: () {
              setState(() {
                _process = 3;
                _assign = 1;
              });
            },
          )
        : _process == 3
            ? Center(
                child: _assign == 1
                    ? AssignTwo(
                        onPressed: () {
                          setState(() {
                            _process = 2;
                          });
                        },
                      )
                    : AssignOne(
                        onPressed: () {
                          setState(() {
                            _process = 2;
                          });
                        },
                      ),
              )
            : Center(
                child: !_selected
                    ? BodyOne(
                        goDetail: () {
                          setState(() {
                            _process = 2;
                          });
                        },
                        onPressed: () {
                          setState(() {
                            _selected = true;
                          });
                        },
                      )
                    : BodyTwo(
                        onPressed: () {
                          setState(() {
                            _selected = false;
                          });
                        },
                      ),
              );
  }
}
