import 'package:flutter/material.dart';

/// constants widgets file
class Constantes {

  static Color defaultColor = Colors.black.withOpacity(.8);

  /// input decoration
  static InputDecoration myInputDecoration(String placeHolder) {
    return InputDecoration(
        labelText: placeHolder,
        enabledBorder: myEnabledBorder(),
        focusedBorder: myFocusedBorder(),
        errorBorder: myErrorBorder(),
        focusedErrorBorder: myFocusedErrorBorder(),
    );
  }

  /// focused border
  static OutlineInputBorder myFocusedErrorBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        )
    );
  }

  /// error border
  static OutlineInputBorder myErrorBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        )
    );
  }

  /// focused border
  static OutlineInputBorder myFocusedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: defaultColor,
          width: 1,
        )
    );
  }

  /// enabled border
  static OutlineInputBorder myEnabledBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: defaultColor,
          width: 1,
        )
    );
  }

}