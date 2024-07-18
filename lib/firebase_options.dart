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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBisZp4RWEURvfSh3DNgJSRolVNJs9mbdg',
    appId: '1:415940511917:web:2c1d44dda7a291231a9e24',
    messagingSenderId: '415940511917',
    projectId: 'spotify-1eb75',
    authDomain: 'spotify-1eb75.firebaseapp.com',
    storageBucket: 'spotify-1eb75.appspot.com',
    measurementId: 'G-BG7YYHZW48',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF5HTNUHrlKb47xF0xdtjulbdCECHX9Oc',
    appId: '1:415940511917:android:bbd5c326af14f2661a9e24',
    messagingSenderId: '415940511917',
    projectId: 'spotify-1eb75',
    storageBucket: 'spotify-1eb75.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWpTM2SMkX8JU1QYWfbHMkjnFfgsJPuwQ',
    appId: '1:415940511917:ios:ce54832cb8672c101a9e24',
    messagingSenderId: '415940511917',
    projectId: 'spotify-1eb75',
    storageBucket: 'spotify-1eb75.appspot.com',
    iosBundleId: 'spotify.app.com.spotifyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBisZp4RWEURvfSh3DNgJSRolVNJs9mbdg',
    appId: '1:415940511917:web:22079b66c350aaf71a9e24',
    messagingSenderId: '415940511917',
    projectId: 'spotify-1eb75',
    authDomain: 'spotify-1eb75.firebaseapp.com',
    storageBucket: 'spotify-1eb75.appspot.com',
    measurementId: 'G-MPGXXG3710',
  );
}