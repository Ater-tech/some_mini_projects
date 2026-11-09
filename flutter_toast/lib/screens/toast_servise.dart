import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastServise {
  static final FToast _fToast = FToast();

  static void init (BuildContext context){
    _fToast.init(context);
  }

  static void show(String msg, {required ToastGravity position}){
    _fToast.removeCustomToast();
    _fToast.removeQueuedCustomToasts();

    _fToast.showToast(      
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black87.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          msg,
          style: TextStyle(color: Colors.white),
          ),
      ),
      gravity: position,
      toastDuration: Duration(seconds: 2),
      );
  }
}