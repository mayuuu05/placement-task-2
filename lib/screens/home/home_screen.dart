import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../services/storage_service.dart';
import '../detail/detail_screen.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              StorageService.clearUser();
              Get.offAll(() => LoginScreen());
            },
          ),
        ],
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          final user = controller.user.value;
          if (user == null) {
            return const Center(child: Text('No user logged in.'));
          }
          return ListView(
            children: [
              ListTile(
                title: Text(user.username),
                onTap: () {
                  Get.to(() => DetailScreen(user: user));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
