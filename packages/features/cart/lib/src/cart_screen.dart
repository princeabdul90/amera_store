/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required this.onPressedContinueShopping})
      : super(key: key);

  final VoidCallback onPressedContinueShopping;

  @override
  Widget build(BuildContext context) {
    return CartView(
      onPressedContinueShopping: onPressedContinueShopping,
    );
  }
}

@visibleForTesting
class CartView extends StatelessWidget {
  const CartView({Key? key, required this.onPressedContinueShopping})
      : super(key: key);

  final VoidCallback onPressedContinueShopping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarTitle(
          title: 'Cart',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: IconButton(
                onPressed: null,
                icon: Icon(
                  FluentIcons.delete_12_regular,
                  color: AppColorStyles.grayDarkColor,
                )),
          )
        ],
      ),
      body: Center(
          child: EmptyCart(
        onPressed: onPressedContinueShopping,
      )),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            bottom: Spacing.getHeight(60),
            left: Spacing.getWidth(10),
            right: Spacing.getWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "Total: \$",
                    style: TextStyle(fontSize: Spacing.getHeight(18)),
                  ),
                  Text(
                    "00.00",
                    style: TextStyle(
                        fontSize: Spacing.getHeight(20),
                        fontWeight: FontWeight.bold,
                        color: AppColorStyles.accentRedColor),
                  )
                ],
              ),
            ),
            CustomButton(
              onPressed: null,
              color: AppColorStyles.primaryColor,
              child: Text(
                "CHECK OUT",
                style: TextStyle(
                  color: AppColorStyles.grayDarkColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
