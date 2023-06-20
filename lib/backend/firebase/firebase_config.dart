import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBqASabuIKKwwxsBAUibnB7g4sJL_FaCJM",
            authDomain: "myawesomeproject-82d56.firebaseapp.com",
            projectId: "myawesomeproject-82d56",
            storageBucket: "myawesomeproject-82d56.appspot.com",
            messagingSenderId: "1011114508054",
            appId: "1:1011114508054:web:4b4b7a57d1b67bc2379a37",
            measurementId: "G-J2W1RH7DQG"));
  } else {
    await Firebase.initializeApp();
  }
}
