import 'package:flutter/material.dart';
import 'package:shop_app/widgets/core/widgets/side_drawer/drawer_header.dart' as shop;
import 'package:shop_app/widgets/core/widgets/side_drawer/drawer_item.dart';
import 'package:shop_app/widgets/order/order_screen.dart';

class SideDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          shop.DrawerHeader(
            title: "UserName",
            icon: Icons.ac_unit,
          ),
          DrawerItem(
            title: "Shop",
            icon: Icons.shop,
            onTap: () => Navigator.of(context).pushReplacementNamed("/"),
          ),
          DrawerItem(
            title: "Orders",
            icon: Icons.payment,
            onTap: () => Navigator.of(context).pushReplacementNamed(OrderScreen.routeName),
          )
        ],
      ),
    );
  }
}
