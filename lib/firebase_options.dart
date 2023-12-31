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
    apiKey: 'AIzaSyAIWJGhJrOVfh-cH7RtYywrd8PfOWfhbQQ',
    appId: '1:496753137177:web:44037f013b668db9bbbc88',
    messagingSenderId: '496753137177',
    projectId: 'flutter-chat-app-d4079',
    authDomain: 'flutter-chat-app-d4079.firebaseapp.com',
    storageBucket: 'flutter-chat-app-d4079.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDph_UnbcvJO9hMqb0nToib2Y4m-ZSjrE',
    appId: '1:496753137177:android:b376fcedb98ec9c7bbbc88',
    messagingSenderId: '496753137177',
    projectId: 'flutter-chat-app-d4079',
    storageBucket: 'flutter-chat-app-d4079.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbIr4_LMbGR-4wEoNAsYgaaAWw3yD1HRs',
    appId: '1:496753137177:ios:cbafa1eb98344283bbbc88',
    messagingSenderId: '496753137177',
    projectId: 'flutter-chat-app-d4079',
    storageBucket: 'flutter-chat-app-d4079.appspot.com',
    iosClientId: '496753137177-pfb32k4chueo6pcjncs7mmadss1o0jp0.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCbIr4_LMbGR-4wEoNAsYgaaAWw3yD1HRs',
    appId: '1:496753137177:ios:4ba4480b26f3807fbbbc88',
    messagingSenderId: '496753137177',
    projectId: 'flutter-chat-app-d4079',
    storageBucket: 'flutter-chat-app-d4079.appspot.com',
    iosClientId: '496753137177-qpje1l3dfmvgpsctrvk6h5h0o3lhhnav.apps.googleusercontent.com',
    iosBundleId: 'com.example.whatsapp.RunnerTests',
  );
}
