import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weellu_web/app/modules/home/components/chat_message.dart';
import 'package:weellu_web/app/modules/home/components/folded_bar.dart';
import 'package:weellu_web/app/modules/home/components/list_chat.dart';

import '../controllers/hometab_controller.dart';

class HomeTabView extends StatefulWidget {
  const HomeTabView({Key key}) : super(key: key);

  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              const Expanded(
                flex: 8,
                child: ChatMessage(),
              ),
          ],
        ),
      ),
    );
  }
}
