import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';
import 'package:weellu_web/app/modules/home/components/cdropdown.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({Key key}) : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    String value = "Messages";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Config.colors.textColorMenu.withOpacity(.7),
            offset: const Offset(0, 0),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: Config.styles.primaryTextStyle
                  .copyWith(color: Config.colors.textColorMenu),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                hintStyle: Config.styles.primaryTextStyle
                    .copyWith(color: Config.colors.textColorMenu),
                hintText: "Search",
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_list,
              color: Config.colors.textColorMenu,
            ),
          ),
          // CustomDropDown(
          //   items: const ["Messages", "Contacts"],
          //   onChanged: (e) {
          //     value = e;
          //     setState(() {});
          //   },
          //   value: value,
          // ),
        ],
      ),
    );
  }
}
