library platform_utils;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformUtils {
  static get({BuildContext context}) {
    return context != null ? Theme.of(context).platform : defaultTargetPlatform;
  }

  static T select<T>(
      {BuildContext context,
      dynamic android,
      dynamic ios,
      dynamic fuchsia,
      dynamic web,
      dynamic defaultWhenNull}) {
    var func;

    if (kIsWeb) {
      func = web;
    } else {
      func = {
        TargetPlatform.iOS: ios,
        TargetPlatform.android: android,
        TargetPlatform.fuchsia: fuchsia,
      }[get(context: context)];
    }

    if (func is Function) {
      return func();
    }

    if (func == null && defaultWhenNull is Function) {
      return defaultWhenNull();
    }

    return func ?? defaultWhenNull;
  }
}
