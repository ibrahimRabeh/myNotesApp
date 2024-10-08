// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart';
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
    apiKey: 'AIzaSyCE0pkfyoUNaNKnAwfur-93Vmj12Zr8uEw',
    appId: '1:966715387634:web:aba0ebd14bcb352b5e2a6b',
    messagingSenderId: '966715387634',
    projectId: 'mynewappmynotes',
    authDomain: 'mynewappmynotes.firebaseapp.com',
    storageBucket: 'mynewappmynotes.appspot.com',
    measurementId: 'G-097YJQ1CV8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8isqzRn5DAmpB2sagKUwoPoFJbaygI0Y',
    appId: '1:966715387634:android:6a3d7f02ed2037975e2a6b',
    messagingSenderId: '966715387634',
    projectId: 'mynewappmynotes',
    storageBucket: 'mynewappmynotes.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWRL1KUYEF6cHno79rv3M46yBk1sPigMo',
    appId: '1:966715387634:ios:7d92c3b7a9990d3b5e2a6b',
    messagingSenderId: '966715387634',
    projectId: 'mynewappmynotes',
    storageBucket: 'mynewappmynotes.appspot.com',
    iosBundleId: 'com.example.mynewappmynotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWRL1KUYEF6cHno79rv3M46yBk1sPigMo',
    appId: '1:966715387634:ios:7d92c3b7a9990d3b5e2a6b',
    messagingSenderId: '966715387634',
    projectId: 'mynewappmynotes',
    storageBucket: 'mynewappmynotes.appspot.com',
    iosBundleId: 'com.example.mynewappmynotes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCE0pkfyoUNaNKnAwfur-93Vmj12Zr8uEw',
    appId: '1:966715387634:web:4668ed576b19909b5e2a6b',
    messagingSenderId: '966715387634',
    projectId: 'mynewappmynotes',
    authDomain: 'mynewappmynotes.firebaseapp.com',
    storageBucket: 'mynewappmynotes.appspot.com',
    measurementId: 'G-6WKW27BPJ4',
  );
}
