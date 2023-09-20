import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/body2.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool _addRequest = false;
  @override
  Widget build(BuildContext context) {
    return !_addRequest
        ? Body(
            onPressed: () {
              setState(() {
                _addRequest = true;
              });
            },
          )
        : RequestBody(
            onPressed: () {
              setState(() {
                _addRequest = false;
              });
            },
          );
  }
}
