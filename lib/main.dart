import 'package:flutter/material.dart';
import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/screens/required_action_screen.dart';
import 'package:notificaciones/screens/reservation_detail_screen.dart';
import 'package:notificaciones/services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // PushNotificationService.messagesStream.listen((message) {
    //   // print('From main.dart');
    //   // print(message.toString());
    //   // navigatorKey.currentState?.pushNamed(
    //   //   message['route'],
    //   //   arguments: message,
    //   // );

    //   print('From main.dart');
    //   print(message.toString());
    //   navigatorKey.currentState?.pushNamed(
    //     message.keys.first,
    //     arguments: message,
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, //para la navegacion
      scaffoldMessengerKey: messengerKey, //para mostrar Snacks
      routes: {
        'home': (_) => const HomeScreen(),
        'message': (_) => const MessageScreen(),
        'reservation': (_) => const ReservationDetailScreen(),
        'required': (_) => const RequiredActionScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
      ),
    );
  }
}
