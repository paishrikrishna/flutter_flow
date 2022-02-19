import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String testname() {
  // return string false
  return "shri";
}

String uppercase(String text) {
  // Add your function code here!
  return text.toUpperCase();
}

int mobileverify(String number) {
  // return length of string

  return number.length;
}

bool inlist(
  List<String> numbers,
  String phone,
) {
  // check if item exisits in list
  if (numbers.contains(phone)) {
    return true;
  } else {
    return false;
  }
}

String qrgenerator(String number) {
  // generate qr code
  var vs =
      'https://api.qrserver.com/v1/create-qr-code/?size=278x278&data=' + number;
  return vs;
}

bool expiry(
  String tgt,
  String current,
) {
  // remove charactersfrom string
  final values = current.split('/');
  final target = tgt.split('/');
  final diff = int.parse(values[0] + values[1] + values[2]) -
      int.parse(target[0] + target[1] + target[2]);
  if (diff <= 0) {
    return true;
  } else {
    return false;
  }
}
