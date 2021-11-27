import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ToastService {

  /// display toast message
  static displayMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.blueGrey,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}