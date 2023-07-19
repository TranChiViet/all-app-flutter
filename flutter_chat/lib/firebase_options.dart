// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCoL4szhJ-cq1_LaZqxJno1ADYCZaQficc',
    appId: '1:381285344721:web:2b356e8373ced2bb1c2cf0',
    messagingSenderId: '381285344721',
    projectId: 'flutter-chat-99d8a',
    authDomain: 'flutter-chat-99d8a.firebaseapp.com',
    storageBucket: 'flutter-chat-99d8a.appspot.com',
    measurementId: 'G-9WGYXYSZKJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWIUuG1eEJNqRlUB09YE0nnkATiL277bk',
    appId: '1:381285344721:android:57bf56c18b158cf21c2cf0',
    messagingSenderId: '381285344721',
    projectId: 'flutter-chat-99d8a',
    storageBucket: 'flutter-chat-99d8a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCC9q65-seiqwfIhNE7gE2vjm62VFmZyLY',
    appId: '1:381285344721:ios:90caf1224f562cee1c2cf0',
    messagingSenderId: '381285344721',
    projectId: 'flutter-chat-99d8a',
    storageBucket: 'flutter-chat-99d8a.appspot.com',
    iosClientId: '381285344721-2h5bc2n10pcs3kpidc86o8eno5pm69bh.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCC9q65-seiqwfIhNE7gE2vjm62VFmZyLY',
    appId: '1:381285344721:ios:90caf1224f562cee1c2cf0',
    messagingSenderId: '381285344721',
    projectId: 'flutter-chat-99d8a',
    storageBucket: 'flutter-chat-99d8a.appspot.com',
    iosClientId: '381285344721-2h5bc2n10pcs3kpidc86o8eno5pm69bh.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterChat',
  );
}
