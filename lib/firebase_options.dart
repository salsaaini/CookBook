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
    apiKey: 'AIzaSyDM3kSladPG_-XkasOnuI1D8o1f7tnp2nk',
    appId: '1:566931189371:web:a3664f487834f8eb2e3cde',
    messagingSenderId: '566931189371',
    projectId: 'my-communityrecipe',
    authDomain: 'my-communityrecipe.firebaseapp.com',
    storageBucket: 'my-communityrecipe.appspot.com',
    measurementId: 'G-HW70Z9RXRG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBr4KUydn7_l_unPewfX5KBHxnbpPVUbzU',
    appId: '1:566931189371:android:117eb9c580db17852e3cde',
    messagingSenderId: '566931189371',
    projectId: 'my-communityrecipe',
    storageBucket: 'my-communityrecipe.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJeeOo4S4hv7-8uLfS9lN_826u0M82Hgc',
    appId: '1:566931189371:ios:0675314195b7e1632e3cde',
    messagingSenderId: '566931189371',
    projectId: 'my-communityrecipe',
    storageBucket: 'my-communityrecipe.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJeeOo4S4hv7-8uLfS9lN_826u0M82Hgc',
    appId: '1:566931189371:ios:9626874d16af6dfb2e3cde',
    messagingSenderId: '566931189371',
    projectId: 'my-communityrecipe',
    storageBucket: 'my-communityrecipe.appspot.com',
    iosBundleId: 'com.example.flutterApplication1.RunnerTests',
  );
}
