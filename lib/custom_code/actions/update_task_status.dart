// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> updateTaskStatus(
  String taskId,
  String status,
) async {
  // update status in 'userTasks' collection in Firebase using taskId (assuming 'taskId' is a field in the documents)
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('userTasks')
        .where('taskId', isEqualTo: taskId)
        .get();

    querySnapshot.docs.forEach((doc) async {
      await FirebaseFirestore.instance
          .collection('userTasks')
          .doc(doc.id) // Use 'doc.id' instead of 'doc.taskId'
          .update({'status': status});
    });
  } catch (e) {
    print('Error updating task status: $e');
    // Handle the error as needed
  }
}
