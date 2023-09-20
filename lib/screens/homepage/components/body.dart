import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:management_tool/providers/auth_provider.dart';
import 'package:management_tool/providers/client_provide.dart';
import 'package:provider/provider.dart';

import 'body1.dart';
import 'detail.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _process = 1;
  String id = '';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _process == 1
            ? BodyOne(
                setDetail: (p0) {
                  setState(() {
                    id = p0;
                  });
                },
                goDetail: () {
                  // set id
                  
                  setState(() {
                    _process = 2;
                  });
                },
              )
            : Detail(
                id: id,
                goList: () async {
                  if (kDebugMode) {
                    print('go list 🎌🎌🎌🎌🎌🎌🎌🎌');
                  }
                  if (kDebugMode) {
                    print(Provider.of<AuthProvider>(context, listen: false)
                        .token);
                  }
                  setState(() {
                    _process = 1;
                  }); 
                },
              ));
  }
}
