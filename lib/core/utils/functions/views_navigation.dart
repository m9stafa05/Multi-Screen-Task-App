import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void navigateIfNeeded(BuildContext context, String targetRoute) {
final current = GoRouter.of(
    context,
  ).routeInformationProvider.value.uri.toString();

  if (current != targetRoute) {
    GoRouter.of(context).go(targetRoute);
    Navigator.pop(context);
  } else {
    Navigator.pop(context);
  }
}
