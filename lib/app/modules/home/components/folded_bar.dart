import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:weellu_web/app/modules/widgets/folded_item.dart';

import '../../../constants/config.dart';
import '../../widgets/drawer_item.dart';

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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var selectValue = MenuItemSelect.HOME;
    onChanged(val) {
      selectValue = val;
      setState(() {});
    }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (widget.onOpenMenu != null)
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 20),
                          child: InkWell(
                            child: Icon(
                              FeatherIcons.menu,
                              size: 25,
                              color: Colors.white,
                            ),
                            onTap: widget.onOpenMenu,
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(
                            image: AssetImage(
                              "assets/images/5.png",
                            ),
                          ),
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  FoldedItem(
                    icon: Icons.home,
                    groupValue: MenuItemSelect.HOME,
                    value: selectValue,
                    press: () {},
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.chat,
                    groupValue: MenuItemSelect.CHAT,
                    value: selectValue,
                    press: () {},
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.people,
                    groupValue: MenuItemSelect.CONTACTS,
                    value: selectValue,
                    press: () {},
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.shopping_cart,
                    groupValue: MenuItemSelect.SHOPPING,
                    value: selectValue,
                    press: () {},
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.notifications,
                    groupValue: MenuItemSelect.NOTIIFICATIONS,
                    value: selectValue,
                    press: () {},
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    icon: Icons.settings,
                    groupValue: MenuItemSelect.SETTINGS,
                    press: () {},
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
