import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateIfNeeded(BuildContext context, String targetRoute) {
  final current = GoRouter.of(
    context,
  ).routerDelegate.currentConfiguration.fullPath;
  if (current != targetRoute) {
    GoRouter.of(context).go(targetRoute);
  } else {
    Navigator.pop(context);
  }
}
