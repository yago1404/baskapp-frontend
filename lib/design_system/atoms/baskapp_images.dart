import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSlot {
  final String location;
  final bool _isSvg;

  const ImageSlot(this.location): _isSvg = false;

  const ImageSlot.svg(this.location): _isSvg = true;

  Widget get asWidget => _isSvg ? SvgPicture.asset(location) : Image.asset(location);
  AssetImage get asImageProvider => AssetImage(location);
}

abstract class BaskappImages {
  // SVG
  static ImageSlot get appLogo => ImageSlot.svg('assets/images/app-logo.svg');

  // PNG
  static ImageSlot get playerBg => ImageSlot('assets/images/login-bg.png');
}