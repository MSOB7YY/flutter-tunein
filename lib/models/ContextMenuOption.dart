import 'package:flutter/material.dart';

class ContextMenuOptions {
  ContextMenuOptions(
      {required this.title,
      required this.icon,
      required this.function,
      required this.id});
  String title;
  IconData icon;
  VoidCallback function;
  int id;
  @override
  String toString() {
    return "ContextMenuOptions{title:${this.title},icon:${this.icon},id:${this.id}";
  }
}
