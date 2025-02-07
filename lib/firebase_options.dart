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
    apiKey: 'AIzaSyA8Q8qFgE8u1InGxhLTuD_XQSnWjrkdC3k',
    appId: '1:723876270582:web:4182a5566586a232fc77d7',
    messagingSenderId: '723876270582',
    projectId: 'employeefirebase-7174d',
    authDomain: 'employeefirebase-7174d.firebaseapp.com',
    storageBucket: 'employeefirebase-7174d.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANvAG6mf-ZJ5A3ClAgty80H2e60DQE9Ys',
    appId: '1:723876270582:android:79ea447f43792f64fc77d7',
    messagingSenderId: '723876270582',
    projectId: 'employeefirebase-7174d',
    storageBucket: 'employeefirebase-7174d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRqjw_xPa2Tm3BDhxWpIS6eQX33Bi9xq8',
    appId: '1:723876270582:ios:66fb25ffd36d9eb2fc77d7',
    messagingSenderId: '723876270582',
    projectId: 'employeefirebase-7174d',
    storageBucket: 'employeefirebase-7174d.firebasestorage.app',
    iosBundleId: 'com.example.employeeFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRqjw_xPa2Tm3BDhxWpIS6eQX33Bi9xq8',
    appId: '1:723876270582:ios:66fb25ffd36d9eb2fc77d7',
    messagingSenderId: '723876270582',
    projectId: 'employeefirebase-7174d',
    storageBucket: 'employeefirebase-7174d.firebasestorage.app',
    iosBundleId: 'com.example.employeeFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8Q8qFgE8u1InGxhLTuD_XQSnWjrkdC3k',
    appId: '1:723876270582:web:8084d57b26b077b0fc77d7',
    messagingSenderId: '723876270582',
    projectId: 'employeefirebase-7174d',
    authDomain: 'employeefirebase-7174d.firebaseapp.com',
    storageBucket: 'employeefirebase-7174d.firebasestorage.app',
  );
}
