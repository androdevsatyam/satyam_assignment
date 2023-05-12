import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn2qMEhOZSy-Ow1NERPhbayoxMN8bSzRE',
    appId: '1:1071357302433:android:0430a619877a1b3449c2e0',
    messagingSenderId: '1071357302433',
    projectId: 'tvnine-8fd2a',
    storageBucket: 'tvnine-8fd2a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDN-_wEfq1aFVjSeNtvI734iH_6lGSG9to',
    appId: '1:1071357302433:ios:8e52801b03e4517a49c2e0',
    messagingSenderId: '1071357302433',
    projectId: 'tvnine-8fd2a',
    storageBucket: 'tvnine-8fd2a.appspot.com',
    androidClientId:
        '1071357302433-4osfvg0mb6hnvm62gec3kr6lcberbldb.apps.googleusercontent.com',
    iosClientId:
        '1071357302433-l8gb5qqbrfqd1lfk0snacnoa2mjsh88e.apps.googleusercontent.com',
    iosBundleId: 'com.androdev.assignment.satyamAssignment',
  );
}
