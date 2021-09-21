
import 'package:event_manager_app/utils/color_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ButtonStyle myBtnStyle()
{
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(whiteColor),
    backgroundColor: MaterialStateProperty.all<Color>(elevatedBtnColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
  );
}