import 'package:flutter/material.dart';
import '../../modal/modal_class.dart';


class DetailScreen extends StatelessWidget {
  final User user;

  const DetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            user.image.isNotEmpty
                ? Image.network(user.image, height: 150, width: 150, fit: BoxFit.cover)
                : const Icon(Icons.person, size: 150),
            const SizedBox(height: 20),
            Text('Full Name: ${user.firstName} ${user.lastName}'),
            Text('Gender: ${user.gender}'),
            Text('Email: ${user.email}'),
          ],
        ),
      ),
    );
  }
}
