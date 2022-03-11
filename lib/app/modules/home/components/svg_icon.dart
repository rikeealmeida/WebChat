import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({Key key, this.asset, this.color, this.size}) : super(key: key);
  final String asset;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      height: size ?? 20,
      color: color ?? Colors.grey,
    );
  }
}
