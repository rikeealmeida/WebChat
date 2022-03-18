import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weellu_web/app/modules/home/widgets/folded_item.dart';

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
  GoogleAuthProvider authProvider = GoogleAuthProvider();
  FirebaseAuth auth = FirebaseAuth.instance;
  User _currentUser;

  bool loginEnabled = false;
  bool logoutEnabled = true;
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
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: NetworkImage(
                          _currentUser == null ? "assets/images/png-transparent-minecraft-sonic-mania-pixel-art-sonic-the-hedgehog-cartoon-character-pixel-art-game-text-sonic-the-hedgehog.png" : _currentUser.photoURL,
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
                    isLogout: false,
                    icon: Icons.home,
                    groupValue: MenuItemSelect.HOME,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    isLogout: false,
                    icon: Icons.chat,
                    groupValue: MenuItemSelect.CHAT,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    isLogout: false,
                    icon: Icons.people,
                    groupValue: MenuItemSelect.CONTACTS,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    isLogout: false,
                    icon: Icons.shopping_cart,
                    groupValue: MenuItemSelect.SHOPPING,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    isLogout: false,
                    icon: Icons.notifications,
                    groupValue: MenuItemSelect.NOTIIFICATIONS,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                  FoldedItem(
                    isLogout: false,
                    icon: Icons.settings,
                    groupValue: MenuItemSelect.SETTINGS,
                    value: selectValue,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
            loginEnabled
                ? FoldedItem(
                    isLogout: true,
                    icon: Icons.login,
                    value: selectValue,
                    onTap: loginEnabled
                        ? () {
                            FirebaseAuth.instance
                                .signInWithPopup(GoogleAuthProvider());
                            setState(() {
                              loginEnabled = false;
                              logoutEnabled = true;
                            });
                          }
                        : null,
                  )
                : SizedBox(),
            logoutEnabled
                ? FoldedItem(
                    isLogout: true,
                    icon: Icons.logout_outlined,
                    value: selectValue,
                    onTap: logoutEnabled
                        ? () {
                            FirebaseAuth.instance.signOut();
                            setState(() {
                              logoutEnabled = false;
                              loginEnabled = true;
                            });
                          }
                        : null,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
