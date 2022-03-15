import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weellu_web/app/constants/config.dart';

import '../../widgets/drawer_item.dart';

class SideBar extends StatefulWidget {
  final Function onOpenMenu;
  const SideBar({
    Key key,
    this.onOpenMenu,
  }) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  var selectValue = MenuItemSelect.HOME;
  onChanged(val) {
    selectValue = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Config.colors.appBarMainColor,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only( top: 20),
                      child: InkWell(
                        child: const Icon(
                          FeatherIcons.menu,
                          size: 25,
                          color: Colors.white,
                        ),
                        onTap: widget.onOpenMenu,
                      ),
                    ),
                    DrawerHeader(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Config.colors.mainColor,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              blurStyle: BlurStyle.normal,
                              color: Colors.black.withAlpha(100),
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: const Image(
                                  image: AssetImage(
                                    "assets/images/png-transparent-minecraft-sonic-mania-pixel-art-sonic-the-hedgehog-cartoon-character-pixel-art-game-text-sonic-the-hedgehog.png",
                                  ),
                                ),
                              ),
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Henrique Almeida dos Santos",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Config.colors.appBarMainColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                DrawerListTile(
                  title: "Início",
                  icon: Icons.home,
                  groupValue: MenuItemSelect.HOME,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  title: "Chats",
                  icon: Icons.chat,
                  groupValue: MenuItemSelect.CHAT,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  title: "Contatos",
                  icon: Icons.people,
                  groupValue: MenuItemSelect.CONTACTS,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  title: "Shopping",
                  icon: Icons.shopping_cart,
                  groupValue: MenuItemSelect.SHOPPING,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  title: "Notificações",
                  icon: Icons.notifications,
                  groupValue: MenuItemSelect.NOTIIFICATIONS,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  title: "Configurações",
                  icon: Icons.settings,
                  groupValue: MenuItemSelect.SETTINGS,
                  press: () {},
                  value: selectValue,
                  onChanged: onChanged,
                ),
              ],
            ),
          ),
          DrawerListTile(
            title: "Deslogar",
            icon: Icons.logout_outlined,
            press: () {},
            value: selectValue,
          ),
        ],
      ),
    );
  }
}
