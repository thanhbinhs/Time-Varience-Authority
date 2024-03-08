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
    apiKey: 'AIzaSyBJOWFQHBpOjL4396GmzTnARbfQ8fh0TDw',
    appId: '1:740226785044:web:bcc2d113585b0ed41f6c01',
    messagingSenderId: '740226785044',
    projectId: 'time-varience-authority-f504c',
    authDomain: 'time-varience-authority-f504c.firebaseapp.com',
    storageBucket: 'time-varience-authority-f504c.appspot.com',

  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHrXpap8NpQEjiyTDFrITAZVIBgvzgzVA',
    appId: '1:740226785044:android:5217d2d97fa0163b1f6c01',
    messagingSenderId: '740226785044',
    projectId: 'time-varience-authority-f504c',
    storageBucket: 'time-varience-authority-f504c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD38q5VS_FhBtYf88XjL7zxUdcfpePUZGI',
    appId: '1:740226785044:ios:9762181f2f679d201f6c01',
    messagingSenderId: '740226785044',
    projectId: 'time-varience-authority-f504c',
    storageBucket: 'time-varience-authority-f504c.appspot.com',
    iosClientId: '740226785044-1h1jrb2aim5jpjvui302ikobvne71rl5.apps.googleusercontent.com',
    iosBundleId: 'com.example.tva',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD38q5VS_FhBtYf88XjL7zxUdcfpePUZGI',
    appId: '1:740226785044:ios:d702cc6c6d9096f21f6c01',
    messagingSenderId: '740226785044',
    projectId: 'time-varience-authority-f504c',
    storageBucket: 'time-varience-authority-f504c.appspot.com',
    iosClientId: '740226785044-onbjtrpkivnpft33vhfdvq7j0afai4uk.apps.googleusercontent.com',
    iosBundleId: 'com.example.tva.RunnerTests',
  );
}
