import 'package:flutter/material.dart';
import 'dart:ui';

double upx(number){
  MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  var _ratio = mediaQuery.size.width / 750;
  return number * _ratio;
}