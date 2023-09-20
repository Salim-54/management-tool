import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:management_tool/providers/item_provider.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/request_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/snack_stuff.dart';
import 'custom_textfield.dart';
import 'dropdown.dart';
import 'float.dart';

class BodyTwo extends StatelessWidget {
  final Function onPressed;
  BodyTwo({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  onPressed();
                },
                child: const Text(
                  'RETURN ITEM',
                  style: TextStyle(
                    color: AppColor.sText,
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Item S/N',
                        style: TextStyle(
                          color: AppColor.sText,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ReturnNFC(),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Printer Count',
                        style: TextStyle(
                          color: AppColor.sLabel,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer<ItemsProvider>(
                      builder: (context, value, child) {
                        return NumberTextField(
                          hintText: 'Write number here',
                          controller: value.itemTagController,
                          onChange: (p0) {
                            value.setTagItem(p0);
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Return  reason',
                        style: TextStyle(
                          color: AppColor.sLabel,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // const CustomTextField(
                    //   hintText: 'Select item',
                    // ),
                    Consumer<RequestProvider>(
                      builder: (context, value, child) {
                        return MyDropdownSearch(
                          onChanged: value.onReturnItemChanged,
                          onSaved: value.onReturnItemSaved,
                          selectedValue: value.returnItem,
                          list: value.reasons,
                          placeholder: "Select Reason",
                        );
                      },
                      // child: ,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                    SaveButton(
                      onPressed: () {
                        if (Provider.of<ItemsProvider>(context, listen: false)
                            .tagItem1
                            .isEmpty) {
                          showSnackbar(context, "Scan NFC First", "fail");
                          return;
                        }

                        if (Provider.of<ItemsProvider>(context, listen: false)
                                .tagItem
                                .isEmpty ||
                            Provider.of<RequestProvider>(context, listen: false)
                                .returnItem!
                                .isEmpty) {
                          showSnackbar(context,
                              "All the fields should be filled first", "fail");
                          return;
                        }
                        if (kDebugMode) {
                          print(
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .tagItem1);
                        }

                        if (kDebugMode) {
                          print(
                              Provider.of<ItemsProvider>(context, listen: false)
                                  .tagItem);
                        }

                        if (kDebugMode) {
                          print(Provider.of<RequestProvider>(context,
                                  listen: false)
                              .returnItem!);
                        }
                        Provider.of<ItemsProvider>(context, listen: false)
                            .itemTagController1
                            .text = "";
                        
                        Provider.of<ItemsProvider>(context, listen: false)
                            .itemTagController
                            .text = "";
                        Provider.of<RequestProvider>(context, listen: false)
                            .onReturnClear();
//onReturnItemChanged
                        showSnackbar(
                            context, "Returned item successfully", "success");
                        return;
                        // onPressed();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnNFC extends StatefulWidget {
  const ReturnNFC({
    Key? key,
  }) : super(key: key);

  @override
  State<ReturnNFC> createState() => _ReturnNFCState();
}

class _ReturnNFCState extends State<ReturnNFC> {
  ValueNotifier<dynamic> result = ValueNotifier(null);

  String text = "";
  bool status = false;
  bool validated = false;
  bool loading = false;
  bool scanned = false;
  bool scan_mode = false;

  void _tagRead() {
    result.addListener(() {
      if (scanned) return;

      setState(() {
        scanned = true;
        text = Utils.generateMd5(result.value.toString());
        Provider.of<ItemsProvider>(context, listen: false)
            .itemTagController1
            .text = text;

        // Utils.showSnackBar(title: text, context: context);
      });
    });

    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      result.value = tag.data;
      NfcManager.instance.stopSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: ScanButton(onPressed: () {
            setState(() {
              scan_mode = true;
              scanned = false;
            });
            _tagRead();
          }),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Consumer<ItemsProvider>(
              builder: (context, value, child) {
                return CustomTextField(
                  controller: value.itemTagController1,
                  onChange: (p0) {
                    value.setTagItem1(p0);
                  },
                  hintText: 'Write number here',
                );
              },
              // child: ,
            ),
          ),
        ),
      ],
    );
  }
}
