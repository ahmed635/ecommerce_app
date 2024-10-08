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
    apiKey: 'AIzaSyA5_sxMCGELCZCFh2iFk6qh-GDOXkDzJJk',
    appId: '1:329924312088:web:2312b2561490a9b5cb176d',
    messagingSenderId: '329924312088',
    projectId: 'ecommerce-app-b893b',
    authDomain: 'ecommerce-app-b893b.firebaseapp.com',
    storageBucket: 'ecommerce-app-b893b.appspot.com',
    measurementId: 'G-9FPP7G1MLD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDGSc1CHzolJ0B6lwTZjWJRH9K5hD3jZs',
    appId: '1:329924312088:android:9a4c765c63e270adcb176d',
    messagingSenderId: '329924312088',
    projectId: 'ecommerce-app-b893b',
    storageBucket: 'ecommerce-app-b893b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl7102Pt-vMobkzmvvpGEVJt5r8APWVgY',
    appId: '1:329924312088:ios:5519c077fee8ab95cb176d',
    messagingSenderId: '329924312088',
    projectId: 'ecommerce-app-b893b',
    storageBucket: 'ecommerce-app-b893b.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl7102Pt-vMobkzmvvpGEVJt5r8APWVgY',
    appId: '1:329924312088:ios:5519c077fee8ab95cb176d',
    messagingSenderId: '329924312088',
    projectId: 'ecommerce-app-b893b',
    storageBucket: 'ecommerce-app-b893b.appspot.com',
    iosBundleId: 'com.example.ecommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA5_sxMCGELCZCFh2iFk6qh-GDOXkDzJJk',
    appId: '1:329924312088:web:5f203a3ab34a3019cb176d',
    messagingSenderId: '329924312088',
    projectId: 'ecommerce-app-b893b',
    authDomain: 'ecommerce-app-b893b.firebaseapp.com',
    storageBucket: 'ecommerce-app-b893b.appspot.com',
    measurementId: 'G-C01C83LX68',
  );
}
