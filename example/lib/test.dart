import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

void test() {
  SchedulerBinding.instance!.runtimeType;
  WidgetsBinding.instance!.runtimeType;
  GestureBinding.instance!.runtimeType;
  RendererBinding.instance!.runtimeType;
  ServicesBinding.instance!.runtimeType;
  PaintingBinding.instance!.runtimeType;
  SemanticsBinding.instance!.runtimeType;
  defaultSchedulingStrategy(
      priority: 100, scheduler: SchedulerBinding.instance!);
}
