import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:management_tool/models/item.model.dart';
import 'package:management_tool/providers/item_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';

class ItemRow extends StatelessWidget {
  final VoidCallback goDetail;
  final Item item;

  const ItemRow({
    super.key,
    required this.goDetail,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            goDetail();
            value.setItemId(item.id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      // make it circle
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColor.sBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/item_pc.svg',
                        width: 23.3,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.model,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.pBlue,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: AppColor.placeText,
                              ),
                            ),
                            // Text(
                            //   item.color,
                            //   style: const TextStyle(
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.w300,
                            //     color: AppColor.placeText,
                            //   ),
                            // ),

                            RichText(
                              text: TextSpan(
                                text: 'Color : ',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColor.placeText,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' ${item.color}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColor.placeText,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '          Count :',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.placeText,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '      ${item.count}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColor.placeText,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/icons/plus.svg',
                        width: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({super.key, required});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, value, child) {
        Item detailedItem = value.findById(value.itemId);
        return InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      // make it circle
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: AppColor.sBlue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/item_pc.svg',
                        width: 23.3,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detailedItem.model,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColor.pBlue,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              detailedItem.name,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                                color: AppColor.placeText,
                              ),
                            ),
                            // Text(
                            //   item.color,
                            //   style: const TextStyle(
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.w300,
                            //     color: AppColor.placeText,
                            //   ),
                            // ),

                            RichText(
                              text: TextSpan(
                                text: 'Color : ',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColor.placeText,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' ${detailedItem.color}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColor.placeText,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: '          Count :',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.placeText,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '      ${detailedItem.count}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColor.placeText,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
