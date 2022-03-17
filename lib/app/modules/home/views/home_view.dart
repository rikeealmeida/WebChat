import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weellu_web/app/constants/config.dart';

import '../components/chat_message.dart';
import '../components/folded_bar.dart';
import '../components/list_chat.dart';
import '../components/sidebar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width);

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      key: _scaffoldKey,
      drawer: width > 1283
          ? Container(
              width: 250,
              child: SideBar(
                onOpenMenu: () {
                  _scaffoldKey.currentState.openEndDrawer();
                },
              ),
            )
          : Container(
              width: 250,
              child: const SideBar(),
            ),
      body: SafeArea(
        child: Row(
          children: [
            if (width > 1283)
              FoldedBar(
                onOpenMenu: () {
                  setState(() {
                    // _folded = !_folded;
                    _scaffoldKey.currentState.openDrawer();
                  });
                },
              ),
            Expanded(
              flex: 4,
              child: ListChat(
                onOpenMenu: width > 1283
                    ? null
                    : () {
                        _scaffoldKey.currentState.openDrawer();
                      },
              ),
            ),
            if (width > 1072)
              Expanded(
                flex: 8,
                child: ChatMessage(),
              ),
          ],
        ),
      ),
    );
  }
}
