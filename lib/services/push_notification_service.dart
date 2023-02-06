//SHA1: E7:F2:53:F7:3B:EE:F1:19:1A:3B:CF:CA:DF:2F:81:9B:A0:9A:18:92

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<Map<String, dynamic>> _messageStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get messagesStream =>
      _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${message.messageId} ');
    // print('From push_notification_service.dart');
    // print(message.data);
    // _messageStream.add(message.data);
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${message.messageId} ');
    // print(message.data);
    // _messageStream.add(message.data['product'] ?? 'no data');
    // print('From push_notification_service.dart');
    // print(message.data);
    // _messageStream.add(message.data);
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.messageId} ');
    // print('From push_notification_service.dart');
    // print(message.data);
    // _messageStream.add(message.data);
  }

  static Future initializeApp() async {
    //push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //local Notifications
  }

  static closeStreams() {
    _messageStream.close();
  }
}
