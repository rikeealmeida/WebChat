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
                Container(
                    decoration: BoxDecoration(
                        color: Config.colors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3,
                              spreadRadius: .2,
                              color: Colors.black.withAlpha(100))
                        ]),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 10, left: 7, right: 7),
                    child: const Text(
                      "Weellu",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
                // Row(
                //   children: [
                //     Container(
                //       margin:
                //           const EdgeInsets.only(top: 20, left: 14, bottom: 10),
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(50),
                //         child: const Image(
                //           image: AssetImage(
                //             "assets/images/5.png",
                //           ),
                //         ),
                //       ),
                //       height: 40,
                //       width: 40,
                //       decoration: BoxDecoration(
                //         color: Colors.transparent,
                //         borderRadius: BorderRadius.circular(50),
                //       ),
                //     ),
                //   ],
                // ),
                const Divider(
                  color: Colors.white,
                ),
                Column(
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
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: const Text(
                        "Henrique Almeida dos Santos",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    )
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
