import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_tool/providers/item_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/client_provide.dart';
import '../../../providers/request_provider.dart';
import 'custom_textfield.dart';
import 'dropdown.dart';
import 'float.dart';

class AssignTwo extends StatelessWidget {
  final Function onPressed;
  AssignTwo({
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
                      'ASSIGN TONER',
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
                    'SALE',
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
                            hintText: 'Write number here',
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Email',
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
                          return CustomTextField(
                            hintText: 'Write number here',
                            controller: value.itemTagController5,
                            onChange: (p0) {
                              value.setTagItem5(p0);
                            },
                          );
                        },
                        //  child: ,
                      ),
                      //   hintText: 'Select item',
                      // ),

                      // MyDropdownSearch(
                      //   list: genderItems,
                      //   placeholder: "Select Office",
                      // ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Phone',
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
                            hintText: 'Write here',
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Address',
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
                          return CustomTextField(
                            hintText: 'Write number here',
                            controller: value.itemTagController5,
                            onChange: (p0) {
                              value.setTagItem5(p0);
                            },
                          );
                        },
                        //  child: ,
                      ),
                      const SizedBox(height: 30),

                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Price: RWF 250,000',
                          style: TextStyle(
                            color: AppColor.pText,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                      SaleButton(
                        name: "Sale Item",
                        onPressed: () {},
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
