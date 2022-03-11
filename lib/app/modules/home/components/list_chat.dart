import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/modules/home/components/button.dart';
import 'package:weellu_web/app/modules/home/components/cdropdown.dart';
import 'package:weellu_web/app/modules/home/components/csearch.dart';

class ListChat extends StatefulWidget {
  const ListChat({Key key}) : super(key: key);

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  String recentValue = "Recent Message";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Config.colors.bodyBackgroundColor.withOpacity(0.5),
            Config.colors.mainColor.withOpacity(0.5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, .5],
        ),
      ),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chats",
                        style: Config.styles.primaryTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      CustomDropDown(
                        items: const ["Recent Message", "Old Message"],
                        onChanged: (e) {
                          recentValue = e;
                          setState(() {});
                        },
                        value: recentValue,
                      ),
                    ],
                  ),
                  CustomButton(
                    title: "New Chat",
                    prefix: Icons.add,
                    onTap: () {},
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomSearch(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
