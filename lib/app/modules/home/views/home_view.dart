import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weellu_web/app/constants/responsive.dart';

import '../components/chat_message.dart';
import '../components/list_chat.dart';
import '../components/sidebar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideBar(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 2,
                child: SideBar(),
              ),
            const Expanded(
              flex: 4,
              child: ListChat(),
            ),
            const Expanded(
              flex: 8,
              child: ChatMessage(),
            ),
          ],
        ),
      ),
    );
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openDrawer();
    }
  }
}
