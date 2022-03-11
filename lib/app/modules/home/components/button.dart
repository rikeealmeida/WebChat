import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/config.dart';

class CustomButton extends StatelessWidget {
  String title;
  final Function onTap;
  final double radius;
  final IconData prefix;

  CustomButton({Key key, this.onTap, this.title, this.radius = 6, this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
              BoxShadow(
                color: Config.colors.shadowButtonColor.withOpacity(.15),
                offset: const Offset(6, 6),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.bottomLeft,
                colors: [
                  Config.colors.mainColor,
                  Config.colors.mainColor,
                  Config.colors.mainColor.withOpacity(.5)
                ])),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefix != null)
              Icon(
                prefix,
                color: Colors.white,
                size: 20,
              ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: Config.styles.primaryTextStyle.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
