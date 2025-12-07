import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDSleX2YnHKN27UpbmVFVsZJYAd8XNtLqc",
            authDomain: "garee-shahadaa.firebaseapp.com",
            projectId: "garee-shahadaa",
            storageBucket: "garee-shahadaa.firebasestorage.app",
            messagingSenderId: "1020289403615",
            appId: "1:1020289403615:web:88ac0b31bd6d1edb48376a"));
  } else {
    await Firebase.initializeApp();
  }
}
