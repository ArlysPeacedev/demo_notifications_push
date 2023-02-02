import 'package:flutter/material.dart';

class ReservationDetailScreen extends StatelessWidget {
  const ReservationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Reservation Detail'),
      ),
      body: const Center(
        child:
            Text('Reservation Detail Screen', style: TextStyle(fontSize: 29)),
      ),
    );
  }
}
