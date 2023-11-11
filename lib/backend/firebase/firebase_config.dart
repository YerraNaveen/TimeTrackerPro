import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC6dsL95YtTCnW3SuaI71cI8CUCKzT3cZY",
            authDomain: "time-tracker-pro-5cba0.firebaseapp.com",
            projectId: "time-tracker-pro-5cba0",
            storageBucket: "time-tracker-pro-5cba0.appspot.com",
            messagingSenderId: "228676617293",
            appId: "1:228676617293:web:f085948e1f9efa2ff4c804",
            measurementId: "G-52QN2K58XT"));
  } else {
    await Firebase.initializeApp();
  }
}
