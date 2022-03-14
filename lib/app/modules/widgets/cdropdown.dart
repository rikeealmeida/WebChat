import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({Key key, this.items, this.onChanged, this.value})
      : super(key: key);
  final List<String> items;
  final Function(dynamic value) onChanged;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      isDense: true,
      onChanged: (e) {
        if (onChanged != null) onChanged(e);
      },
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Config.colors.textColorMenu,
      ),
      hint: Text(
        value,
        style: Config.styles.primaryTextStyle.copyWith(
          color: Config.colors.textColorMenu,
        ),
      ),
      items: items
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: Config.styles.primaryTextStyle.copyWith(
                  color: Config.colors.textColorMenu,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
