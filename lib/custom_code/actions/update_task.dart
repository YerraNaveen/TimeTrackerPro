// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateTask(String taskId, String key1, String val1, String key2,
    DateTime val2, String key3, double val3, String key4, String val4) async {
  final taskReference =
      FirebaseFirestore.instance.collection('userTasks').doc(taskId);

  final updates = <String, dynamic>{key1: val1};

  if (key2 != null) {
    updates[key2!] = val2!;
  }
  if (key3 != null) {
    updates[key3!] = val3!;
  }
  if (key4 != null) {
    updates[key4!] = val4!;
  }

  await taskReference.update(updates);
}
