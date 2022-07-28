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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7Sr4LM0_GmFtXuXbV_dq1eOgZ3zULzvk',
    appId: '1:237864922118:android:4bf8e21fd4b14787936787',
    messagingSenderId: '237864922118',
    projectId: 'tododemo-3bdb3',
    storageBucket: 'tododemo-3bdb3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzduXRb4frEPbUjOYgN0C7Dgy_6nEmFtk',
    appId: '1:237864922118:ios:4f579865baabb6a4936787',
    messagingSenderId: '237864922118',
    projectId: 'tododemo-3bdb3',
    storageBucket: 'tododemo-3bdb3.appspot.com',
    androidClientId: '237864922118-u4sjf772310aljpbodks51d0bferfd98.apps.googleusercontent.com',
    iosClientId: '237864922118-6vmvgvbg37a9tfqsn4u87jd72pdml28k.apps.googleusercontent.com',
    iosBundleId: 'com.example.toDoDemo',
  );
}