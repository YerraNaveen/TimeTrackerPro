import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getDurationInMinutes(
  DateTime? startTIme,
  DateTime? endTime,
) {
  // difference between two params in seconds
// difference between two params in seconds
  if (startTIme == null || endTime == null) {
    return null;
  }

  return double.parse((endTime.difference(startTIme).inSeconds.toDouble() / 60)
      .toStringAsFixed(1));
}

String? getUserRewardPoints() {
  // calculate sum of rewardPoints from userTasks table from firebase
  double sum = 0.0;
  String userId = "nxocE96lNycMPanzBaPCQKHdE713";
  FirebaseFirestore.instance
      .collection('userTasks')
      .where('userId', isEqualTo: userId)
      .get()
      .then((querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      if (doc['rewardPoints'] != null) sum += doc['rewardPoints'];
    });
  });
  return sum.toString();
}
