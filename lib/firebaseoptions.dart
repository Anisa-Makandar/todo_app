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
    apiKey: 'AIzaSyCCHRgfoUQ5vTpEqiCECdpus9juuyC_jZo',
    appId: '1:123591662539:web:19c9a8f02f1d9e916cb44e',
    messagingSenderId: '123591662539',
    projectId: 'taskmanaging-eb58a',
    authDomain: 'taskmanaging-eb58a.firebaseapp.com',
    storageBucket: 'taskmanaging-eb58a.firebasestorage.app',
    measurementId: 'G-9XWGV95LS7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvkS1zFDs4kf4aZjABfSLHDHpUUbgJQcQ',
    appId: '1:123591662539:android:fec983dcfe1915a96cb44e',
    messagingSenderId: '123591662539',
    projectId: 'taskmanaging-eb58a',
    storageBucket: 'taskmanaging-eb58a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA0UGTmxx6jGbenvp3T4XOlpBPD5lmCitU',
    appId: '1:123591662539:ios:7fdff5e23ccb4a166cb44e',
    messagingSenderId: '123591662539',
    projectId: 'taskmanaging-eb58a',
    storageBucket: 'taskmanaging-eb58a.firebasestorage.app',
    iosBundleId: 'com.example.taskManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA0UGTmxx6jGbenvp3T4XOlpBPD5lmCitU',
    appId: '1:123591662539:ios:7fdff5e23ccb4a166cb44e',
    messagingSenderId: '123591662539',
    projectId: 'taskmanaging-eb58a',
    storageBucket: 'taskmanaging-eb58a.firebasestorage.app',
    iosBundleId: 'com.example.taskManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCCHRgfoUQ5vTpEqiCECdpus9juuyC_jZo',
    appId: '1:123591662539:web:b3fe4cec93cbbd146cb44e',
    messagingSenderId: '123591662539',
    projectId: 'taskmanaging-eb58a',
    authDomain: 'taskmanaging-eb58a.firebaseapp.com',
    storageBucket: 'taskmanaging-eb58a.firebasestorage.app',
    measurementId: 'G-FVDE39N8SR',
  );
}
