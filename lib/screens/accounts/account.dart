import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:delivery_app/widgets/appicons.dart';
import 'package:delivery_app/widgets/icon_tile.dart';
import 'package:delivery_app/widgets/text.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade100.withOpacity(0.4),
      appBar: AppBar(
          title: BigText(
        text: 'Account',
        color: Colors.white,
        size: Dimentions.font26,
      )),
      body: Container(
        padding: EdgeInsets.only(top: Dimentions.h10 / 2),
        width: double.maxFinite,
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              bgColor: main1Color,
              iconColor: Colors.white,
              size: Dimentions.h20 * 7,
              iconSize: Dimentions.h20 * 4,
            ),
            //name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    IconTile(
                      icon: Icons.person,
                      text: 'onchez',
                    ),
                    //phone
                    IconTile(
                      color: iconColor1,
                      icon: Icons.phone,
                      text: '+254757218603',
                    ),
                    //email
                    IconTile(
                      color: iconColor1,
                      icon: Icons.email,
                      text: 'brianonchezz@gmail.com',
                    ),
                    //location
                    IconTile(
                      color: iconColor1,
                      icon: Icons.add_location,
                      text: 'fill your location',
                    ),
                    //messages
                    IconTile(
                      color: iconColor2,
                      icon: Icons.message,
                      text: 'none',
                    ),
                    //logout
                    IconTile(
                      color: iconColor2,
                      icon: Icons.logout,
                      text: 'logout',
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
