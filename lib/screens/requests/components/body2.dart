import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_tool/providers/client_provide.dart';
import 'package:management_tool/providers/item_provider.dart';
import 'package:management_tool/providers/request_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../utils/snack_stuff.dart';
import '../../items/components/custom_textfield.dart';
import '../../items/components/dropdown.dart';
import '../../items/components/float.dart';

class RequestBody extends StatelessWidget {
  final Function onPressed;
  RequestBody({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final List<String> genderItems = [
    'Printer Sony - Toner T-23',
    'Printer Sony - Toner T-90',
    'Printer Sony - Toner T-42',
    'Printer Sony - Toner T-54'
  ];

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
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      onPressed();
                    },
                    child: const Text(
                      'ISHEMA HUB',
                      style: TextStyle(
                        color: AppColor.sText,
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SvgPicture.asset(
                    'assets/icons/sub.svg',
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'REQUEST ITEM',
                    style: TextStyle(
                      color: AppColor.sText,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Client',
                          style: TextStyle(
                            color: AppColor.sLabel,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      Consumer<ClientsProvider>(
                        builder: (context, value, child) {
                          return MyDropdownSearch(
                            onChanged: value.onSelectedClientChanged,
                            onSaved: value.onSelectedClientSaved,
                            selectedValue: value.selectedClient,
                            list: value.droppedClients,
                            placeholder: "Select Client",
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Item',
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
                          return MyDropdownSearch(
                            onChanged: value.onRequestItemChanged,
                            onSaved: value.onRequestItemSaved,
                            selectedValue: value.requestItem,
                            list: value.droppedItems,
                            placeholder: "Select Item",
                          );
                        },
                      ),

                      const SizedBox(height: 10),
                      // const CustomTextField(
                      //   hintTexIt: 'Select item',
                      // ),

                      // MyDropdownSearch(
                      //   list: genderItems,
                      //   placeholder: "Select Item",
                      // ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Quantity',
                          style: TextStyle(
                            color: AppColor.sLabel,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Consumer<RequestProvider>(
                        builder: (context, value, child) {
                          return NumberTextField(
                            controller: value.quantityController,
                            onChange: (p0) {
                              value.onQuantityChanged(p0);
                            },
                            hintText: 'Quantity',
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Reason',
                          style: TextStyle(
                            color: AppColor.sLabel,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Consumer<RequestProvider>(
                        builder: (context, value, child) {
                          return MultiLinesTextField(
                            controller: value.reasonController,
                            onChange: (p0) {
                              value.onReasonChanged(p0);
                            },
                            hintText: 'Write here',
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      SaleButton(
                        name: "Send Request",
                        onPressed: () {
                          if (Provider.of<ClientsProvider>(context,
                                      listen: false)
                                  .selectedClient ==
                              null) {
                            showSnackbar(
                                context, "A client should be selected", "fail");
                            return;
                          }
                          if (Provider.of<ItemsProvider>(context, listen: false)
                                  .requestItem ==
                              null) {
                            showSnackbar(context,
                                "A product item should be selected", "fail");
                            return;
                          }
                          if (Provider.of<RequestProvider>(context,
                                  listen: false)
                              .quantity
                              .isEmpty) {
                            showSnackbar(context, "Enter quantity", "fail");
                            return;
                          }

                          if (Provider.of<RequestProvider>(context,
                                  listen: false)
                              .reason
                              .isEmpty) {
                            showSnackbar(context, "Enter reason", "fail");
                            return;
                          }

                          Provider.of<RequestProvider>(context, listen: false)
                              .reasonController
                              .clear();
                          Provider.of<ClientsProvider>(context, listen: false)
                              .onSelectedClientClear();


                          Provider.of<ItemsProvider>(context, listen: false)
                              .onRequestItemClear();

                          Provider.of<RequestProvider>(context, listen: false)
                              .quantityController
                              .clear();
                              
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
