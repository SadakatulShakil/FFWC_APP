import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {

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
        return web;
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
    apiKey: 'AIzaSyDUuGsMu8Hke5kCf1tmKQgtdbJBkDVlufA',
    appId: '1:912083609281:android:0f97836bce9df6905b1640',
    messagingSenderId: '912083609281',
    projectId: 'ffwc-4c802',
    storageBucket: 'ffwc-4c802.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAaJjzbcBfUu1niU0FCa7VRqUEGq73E9ns',
    appId: '1:523768930449:ios:185c309fa15e881823df30',
    messagingSenderId: '523768930449',
    projectId: 'landslide-459607',
    storageBucket: 'landslide-459607.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAWtc6JC4wF8bQH_mVFw8HqF3L7nHPAGxI',
    appId: '1:523768930449:web:043b4e63a3d7232123df30',
    messagingSenderId: '523768930449',
    projectId: 'landslide-459607',
    storageBucket: 'landslide-459607.firebasestorage.app',
  );

}