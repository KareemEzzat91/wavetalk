// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyD6b6R3pWsGYQ-QQcaLQU7Icvryq25bB-4',
    appId: '1:823241191431:web:b9cbe4def59b5190737aa2',
    messagingSenderId: '823241191431',
    projectId: 'wavetalk-c93ab',
    authDomain: 'wavetalk-c93ab.firebaseapp.com',
    storageBucket: 'wavetalk-c93ab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB89s5sO3CcIAJ2VcHpbdfUJWfn9YA5DH0',
    appId: '1:823241191431:android:d2cd9f2ce3ae1d01737aa2',
    messagingSenderId: '823241191431',
    projectId: 'wavetalk-c93ab',
    storageBucket: 'wavetalk-c93ab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALmZPSKOJm1Y94GdaLSELEqhHaItfMtpA',
    appId: '1:823241191431:ios:fd2f7af940c00380737aa2',
    messagingSenderId: '823241191431',
    projectId: 'wavetalk-c93ab',
    storageBucket: 'wavetalk-c93ab.appspot.com',
    iosBundleId: 'com.example.wavetalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALmZPSKOJm1Y94GdaLSELEqhHaItfMtpA',
    appId: '1:823241191431:ios:fd2f7af940c00380737aa2',
    messagingSenderId: '823241191431',
    projectId: 'wavetalk-c93ab',
    storageBucket: 'wavetalk-c93ab.appspot.com',
    iosBundleId: 'com.example.wavetalk',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD6b6R3pWsGYQ-QQcaLQU7Icvryq25bB-4',
    appId: '1:823241191431:web:5b2342707665a754737aa2',
    messagingSenderId: '823241191431',
    projectId: 'wavetalk-c93ab',
    authDomain: 'wavetalk-c93ab.firebaseapp.com',
    storageBucket: 'wavetalk-c93ab.appspot.com',
  );
}
