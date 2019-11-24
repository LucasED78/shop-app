import 'package:flutter/material.dart';
import 'package:shop_app/widgets/core/widgets/side_drawer/drawer_header.dart' as shop;
import 'package:shop_app/widgets/core/widgets/side_drawer/drawer_item.dart';

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
            title: "Orders",
            icon: Icons.add_shopping_cart,
            onTap: () => {},
          )
        ],
      ),
    );
  }
}
