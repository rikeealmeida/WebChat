import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/modules/home/widgets/drawer_item.dart';

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
  GoogleAuthProvider authProvider = GoogleAuthProvider();
  FirebaseAuth auth = FirebaseAuth.instance;
  User _currentUser;
  bool loginEnabled = true;
  bool logoutEnabled = false;
  var selectValue = MenuItemSelect.HOME;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _currentUser = user;
      });
    });
  }

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
                        child: Image(
                          image: NetworkImage(
                            _currentUser == null
                                ? "assets/images/png-transparent-minecraft-sonic-mania-pixel-art-sonic-the-hedgehog-cartoon-character-pixel-art-game-text-sonic-the-hedgehog.png"
                                : _currentUser.photoURL,
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
                      child: Text(
                        _currentUser == null ? "Bem vindo!" : "Bem vindo!\n${_currentUser.displayName.toUpperCase()}",
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
                  isLogout: false,
                  title: "Início",
                  icon: Icons.home,
                  groupValue: MenuItemSelect.HOME,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  isLogout: false,
                  title: "Chats",
                  icon: Icons.chat,
                  groupValue: MenuItemSelect.CHAT,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  isLogout: false,
                  title: "Contatos",
                  icon: Icons.people,
                  groupValue: MenuItemSelect.CONTACTS,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  isLogout: false,
                  title: "Shopping",
                  icon: Icons.shopping_cart,
                  groupValue: MenuItemSelect.SHOPPING,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  isLogout: false,
                  title: "Notificações",
                  icon: Icons.notifications,
                  groupValue: MenuItemSelect.NOTIIFICATIONS,
                  value: selectValue,
                  press: () {},
                  onChanged: onChanged,
                ),
                DrawerListTile(
                  isLogout: false,
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
          loginEnabled
              ? DrawerListTile(
                  isLogout: true,
                  title: "logar",
                  icon: Icons.login_outlined,
                  press: loginEnabled
                      ? () {
                          FirebaseAuth.instance
                              .signInWithPopup(GoogleAuthProvider());
                          setState(() {
                            loginEnabled = false;
                            logoutEnabled = true;
                          });
                        }
                      : null,
                  value: selectValue,
                )
              : SizedBox(),
          logoutEnabled
              ? DrawerListTile(
                  isLogout: true,
                  title: "Deslogar",
                  icon: Icons.logout_outlined,
                  press: logoutEnabled
                      ? () {
                          FirebaseAuth.instance.signOut();
                          setState(() {
                            logoutEnabled = false;
                            loginEnabled = true;
                          });
                        }
                      : null,
                  value: selectValue,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
