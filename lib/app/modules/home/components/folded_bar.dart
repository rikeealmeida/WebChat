import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/modules/widgets/folded_item.dart';

import '../../../constants/config.dart';

class FoldedBar extends StatefulWidget {
  final Function onOpenMenu;
  const FoldedBar({
    Key key,
    this.onOpenMenu,
  }) : super(key: key);

  @override
  State<FoldedBar> createState() => _FoldedBarState();
}

class _FoldedBarState extends State<FoldedBar> {
  var selectValue = MenuItemSelect.HOME;
  onChanged(val) {
    selectValue = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: 70,
      child: Scaffold(
        backgroundColor: Config.colors.appBarMainColor,
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: const Image(
                        image: AssetImage(
                          "assets/images/png-transparent-minecraft-sonic-mania-pixel-art-sonic-the-hedgehog-cartoon-character-pixel-art-game-text-sonic-the-hedgehog.png",
                        ),
                      ),
                    ),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  FoldedItem(
                    icon: Icons.home,
                    groupValue: MenuItemSelect.HOME,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.chat,
                    groupValue: MenuItemSelect.CHAT,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.people,
                    groupValue: MenuItemSelect.CONTACTS,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.shopping_cart,
                    groupValue: MenuItemSelect.SHOPPING,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.notifications,
                    groupValue: MenuItemSelect.NOTIIFICATIONS,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.settings,
                    groupValue: MenuItemSelect.SETTINGS,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
            FoldedItem(icon: Icons.logout_outlined, value: selectValue),
          ],
        ),
      ),
    );
  }
}
