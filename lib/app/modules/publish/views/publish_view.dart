import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weellu_web/app/modules/home/components/folded_bar.dart';

import '../controllers/publish_controller.dart';

class PublishTabView extends GetView<PublishTabController> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.green,
              )),
          Expanded(
              flex: 8,
              child: Container(
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
