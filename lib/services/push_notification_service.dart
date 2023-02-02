//SHA1: E7:F2:53:F7:3B:EE:F1:19:1A:3B:CF:CA:DF:2F:81:9B:A0:9A:18:92

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notificaciones/screens/message_screen.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController
      .broadcast(); //<el StreamController puede ser String, mapa, lista>

  static Stream<String> get messageStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    //print('onBackground Handler ${message.messageId} ');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'no data');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    //print('onMessage Handler ${reservati} ');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'no data');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    //print('onMessageOpenApp Handler ${message.messageId} ');
    print(message.data);
    _messageStream.add(message.data['product'] ?? 'no data');
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
