import 'package:get/get.dart';
import '../modal/modal_class.dart';
import '../services/storage_service.dart';

class HomeController extends GetxController {
  var user = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    _loadUser();
  }

  void _loadUser() async {
    user.value = await StorageService.getUser();
  }

  void logout() {
    StorageService.clearUser();
    user.value = null;
    Get.offAllNamed('/login');
  }
}
