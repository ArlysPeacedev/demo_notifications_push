import 'package:flutter/material.dart';

class RequiredActionScreen extends StatelessWidget {
  const RequiredActionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Required Action'),
      ),
      body: Center(
        child: Text('Required Action : $args',
            style: const TextStyle(fontSize: 29)),
      ),
    );
  }
}
