import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void snackbar(BuildContext context, {required String mesage}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mesage),
    ),
  );
}
