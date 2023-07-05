// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.fuchsia:
        break;
    }
    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAkanL9QBCOw7A_MiFwwqCe9dON1M2mkVI',
    appId: '1:1087088507796:web:eaa88d82b2c5d034592d81',
    messagingSenderId: '1087088507796',
    projectId: 'foodapp-2c2cc',
    authDomain: 'foodapp-2c2cc.firebaseapp.com',
    storageBucket: 'foodapp-2c2cc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDtvxvyXa2vxFazYE45EdLaehdgrIHVRE',
    appId: '1:1087088507796:android:57697887ce96ebfb592d81',
    messagingSenderId: '1087088507796',
    projectId: 'foodapp-2c2cc',
    storageBucket: 'foodapp-2c2cc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvRyMdAr70_b_4OzaLo0MoC9XAo19scyE',
    appId: '1:1087088507796:ios:303314245848a158592d81',
    messagingSenderId: '1087088507796',
    projectId: 'foodapp-2c2cc',
    storageBucket: 'foodapp-2c2cc.appspot.com',
    iosClientId:
        '1087088507796-cus999s6mv6olevaa7r8e86tr3f8gb8n.apps.googleusercontent.com',
    iosBundleId: 'com.example.verygoodcore.foodapp',
  );
}
