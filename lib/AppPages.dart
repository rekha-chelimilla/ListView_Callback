import 'dart:js';
import 'package:flutter/material.dart';
import 'package:list_view_app/ListItemDetailsScreen.dart';
import 'package:list_view_app/AppRoutes.dart';
import 'package:list_view_app/ListScreen.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.ListScreen: ((context) => ListScreen()),
      AppRoutes.AddDetailsScreen: ((context) => ListItemDetails()),
    };
  }
}
