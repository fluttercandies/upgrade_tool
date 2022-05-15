import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void test() {
  SchedulerBinding.instance!.runtimeType;
  WidgetsBinding.instance!.runtimeType;
  GestureBinding.instance!.runtimeType;
  RendererBinding.instance!.runtimeType;
}
