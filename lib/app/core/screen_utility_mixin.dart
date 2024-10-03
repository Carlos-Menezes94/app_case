import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Usado a lib flutter_screenutil pois ela calcula o tamanho de cada tela através de pixels de qualquer dispositivo

//Mixin com propriedades para o layout responsivo
mixin ScreenUtilityMixin {
  double setWidth(num width) {
    return ScreenUtil().setWidth(width);
  }

  double setHeight(num height) {
    return ScreenUtil().setHeight(height);
  }

  double setRadius(num radius) {
    return ScreenUtil().radius(radius);
  }

  double setFontSize(num fontSize) {
    return ScreenUtil().setSp(fontSize);
  }

  Size setProperSize({required double width, required double height}) {
    final aspectRatio = width / height;
    return Size(setWidth(width), setWidth(width) / aspectRatio);
  }
}
